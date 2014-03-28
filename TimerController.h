//
//  TimerController.h
//  Timer
//
//  Created by Wilfredo Sánchez on 7/21/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TimerController : NSObject
{
    IBOutlet NSTextField* minutesField;
    IBOutlet NSTextField* secondsField;
    IBOutlet NSTextField* countdownFromField;
    IBOutlet NSButton*    goButton;

    NSTimer* myTimer;
    Boolean  running;

    int mySecondsStart;
    int mySeconds;
}

- (IBAction) start: (id)aSender;
- (IBAction) updatePreferences: (id)aSender;

@end
