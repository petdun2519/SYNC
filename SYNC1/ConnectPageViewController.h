//
//  ConnectPageViewContoller.h
//  SYNC1
//
//  Created by Peter Dunlop on 8/17/14.
//  Copyright (c) 2014 tpetdu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <AddressBookUI/AddressBookUI.h>
#import "SessionManager.h"
#import "DataHandler.h"
#import "DataProvider.h"

@interface ConnectPageViewController : UIViewController <DataHandlerStatusMessageDelegate>{
    
    DataHandler *_dataHandler;
    SessionManager *_sessionManager;
    
	BOOL myContactMustBeDefined;
	ABRecordID myContactID;

}

@property (strong, nonatomic) AppDelegate *appDelegate;

- (ABRecordID)getMyContactID;
+(void)_keepAtLinkTime;

@end
