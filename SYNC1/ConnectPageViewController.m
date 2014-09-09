//
//  ConnectPageViewContoller.m
//  SYNC1
//
//  Created by Peter Dunlop on 8/17/14.
//  Copyright (c) 2014 tpetdu. All rights reserved.
//

#import "ConnectPageViewController.h"
#import "AppDelegate.h"
#import "ContactDataProvider.h"
#import "Device.h"

#define MY_CONTACT_ID_PROP @"MY_CONTACT_ID"
#define AVAILABLE_SOUND_FILE_NAME "available"
#define UNAVAILABLE_SOUND_FILE_NAME "unavailable"

#define ALERTVIEW_BUTTONS_OK NSLocalizedString(@"alertview.buttons.ok", @"Ok Button")
#define ALERTVIEW_BUTTONS_YES NSLocalizedString(@"alertview.buttons.yes", @"yes")
#define ALERTVIEW_BUTTONS_NO NSLocalizedString(@"alertview.buttons.no", @"no")
#define ALERTVIEW_BUTTONS_CANCEL NSLocalizedString(@"alertview.buttons.cancel", @"cancel")

#define PROGRESS_ALERT_VIEW_TAG 0
#define PROMPT_ALERT_VIEW_TAG 1
#define INFORMATION_ALERT_VIEW_TAG 2

@implementation ConnectPageViewController{
    
    UIAlertView *_alertViewCommunicationState;
    
    MessageCompletionBlock _leftOrCenterButtonCompletion;
    MessageCompletionBlock _rightButtonCompletion;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
    NSLog(@"ConnectPageViewControllerInit\n");
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//	if (myContactMustBeDefined) {
//		[self showDefineContactDialog];
//		[self configureMyContact:nil];
//		myContactMustBeDefined = NO;
//	}
    NSLog(@"View has loaded\n");
}

- (IBAction)configureMyContact:(id)sender {
	ABPeoplePickerNavigationController *peoplePicker = [[ABPeoplePickerNavigationController alloc] init];
	peoplePicker.peoplePickerDelegate = self;
	peoplePicker.navigationBar.topItem.title = NSLocalizedString(@"CHOOSE_CONTACT_TITLE", @"Defining my contact title.");
    [self presentViewController:peoplePicker animated:YES completion:nil];
}

- (void)showDefineContactDialog {
	UIAlertView *confirmationView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"CHOOSE_CONTACT_TITLE", @"Defining my contact dialog title.")
															   message:NSLocalizedString(@"CHOOSE_CONTACT_PROMPT", @"Defining my contact dialog text.")
															  delegate:nil
													 cancelButtonTitle:NSLocalizedString(@"CHOOSE_CONTACT_OK_BTN", @"Defining my contact dialog button.")
													 otherButtonTitles:nil];
	
	[confirmationView show];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
     self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _sessionManager = [[SessionManager alloc] init];
    
    _dataHandler = [[DataHandler alloc] initWithDataProvider:[self createSpecificDataProvider] sessionManager:_sessionManager];
    _dataHandler.delegate = self;
    
//	myContactID = [self getMyContactID];

	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceAvailable:) name:NOTIFICATION_DEVICE_AVAILABLE object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceUnavailable:) name:NOTIFICATION_DEVICE_UNAVAILABLE object:nil];
	
	[_sessionManager start];
	
//	if (myContactID != 0) {
//		[self refreshMyContactButton];
//	} else {
//		myContactMustBeDefined = YES;
//	}
}

+(void)_keepAtLinkTime{

}
- (void)refreshMyContactButton {
	if (myContactID != 0) {
        
        if (ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized) {
            [self resetMyContactInformation];
        } else {
            CFErrorRef *error;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
            
            if (addressBook) {
                ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        if (granted) {
                            ABRecordRef person = ABAddressBookGetPersonWithRecordID(addressBook, myContactID);
                            if (person != NULL) {
                                NSString *personName = (NSString *)CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
                                //myContactLabel.text = personName;
                            } else {
                                [self resetMyContactInformation];
                            }
                            CFRelease(addressBook);
                        }
                    });
                });
            }
        }
	}
}

- (void)resetMyContactInformation {
    myContactID = 0;
    [self saveMyContactID:myContactID];
    myContactMustBeDefined = YES;
}

- (void)saveMyContactID:(ABRecordID)recordID {
	[[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", recordID] forKey:MY_CONTACT_ID_PROP];
}


- (NSObject<DataProvider> *)createSpecificDataProvider {
	return [[ContactDataProvider alloc] initWithMainViewController:self];
}

- (ABRecordID)getMyContactID {
	NSString *loadedContactID = [[NSUserDefaults standardUserDefaults] objectForKey:MY_CONTACT_ID_PROP];
	if (loadedContactID)
		return [loadedContactID intValue];
	else
		return 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DataHandlerStatusMessageDelegate <NSObject>

- (void)dataHandlerShouldDismissCurrentMessage:(DataHandler *)dataHandler {
    [self runBlockInMainQueue:^{
        if (_alertViewCommunicationState) {
            _leftOrCenterButtonCompletion = nil;
            _rightButtonCompletion = nil;
            
            _alertViewCommunicationState.delegate = nil;
            
            [_alertViewCommunicationState dismissWithClickedButtonIndex:0 animated:NO];
            _alertViewCommunicationState = nil;
        }
    }];
}

- (void)dataHandler:(DataHandler *)dataHandler shouldDisplayMessage:(NSString *)message withTitle:(NSString *)title leftOrCenterButtonCompletion:(MessageCompletionBlock)leftOrCenterButtonCompletion rightButtonCompletion:(MessageCompletionBlock)rightButtonCompletion {
    
    [self runBlockInMainQueue:^{
        [self dataHandlerShouldDismissCurrentMessage:dataHandler];
        
        _leftOrCenterButtonCompletion = leftOrCenterButtonCompletion;
        _rightButtonCompletion = rightButtonCompletion;
        
        int alertViewTag;
        
        NSString *cancelButtonTitle;
        NSString *otherButtonTitle = nil;
        
        if (leftOrCenterButtonCompletion && rightButtonCompletion) {
            alertViewTag = PROMPT_ALERT_VIEW_TAG;
            cancelButtonTitle = ALERTVIEW_BUTTONS_NO;
            otherButtonTitle = ALERTVIEW_BUTTONS_YES;
        } else if (leftOrCenterButtonCompletion) {
            alertViewTag = PROGRESS_ALERT_VIEW_TAG;
            cancelButtonTitle = ALERTVIEW_BUTTONS_CANCEL;
        } else {
            alertViewTag = INFORMATION_ALERT_VIEW_TAG;
            cancelButtonTitle = ALERTVIEW_BUTTONS_OK;
        }
        
        _alertViewCommunicationState = [[UIAlertView alloc] initWithTitle:title
                                                                  message:message
                                                                 delegate:self
                                                        cancelButtonTitle:cancelButtonTitle
                                                        otherButtonTitles:otherButtonTitle, nil];
        
        
        _alertViewCommunicationState.tag = alertViewTag;
        _alertViewCommunicationState.delegate = self;
        [_alertViewCommunicationState show];
    }];
}

- (void)runBlockInMainQueue:(void (^)(void))block {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

- (void)executeBlockSafely:(void (^)(void))block {
    if (block) {
        block();
    }
}


#pragma mark - Memory Management Methods

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_sessionManager stop];
    [_sessionManager.session disconnect];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
