//
//  ViewConnectionViewController.m
//  SYNC1
//
//  Created by Peter Dunlop on 8/18/14.
//  Copyright (c) 2014 tpetdu. All rights reserved.
//

#import "ViewConnectionViewController.h"

@interface ViewConnectionViewController ()

@end

@implementation ViewConnectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleReceivedDataWithNotification:)
                                                 name:@"MPCDemo_DidReceiveDataNotification"
                                               object:nil];
}

- (void)handleReceivedDataWithNotification:(NSNotification *)notification {
    // Get the user info dictionary that was received along with the notification.
//    NSDictionary *userInfoDict = [notification userInfo];
//    
//    // Convert the received data into a NSString object.
//    NSData *receivedData = [userInfoDict objectForKey:@"data"];
//    NSString *message = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
//    
//    // Keep the sender's peerID and get its display name.
//    MCPeerID *senderPeerID = [userInfoDict objectForKey:@"peerID"];
//    NSString *senderDisplayName = senderPeerID.displayName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
