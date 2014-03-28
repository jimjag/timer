//
//  TimerController.m
//  Timer
//
//  Created by Wilfredo Sánchez on 7/21/05.
//  Copyright 2005-2014 The Apache Software Foundation. All rights reserved.
//

#import "TimerController.h"

@implementation TimerController

- (void) awakeFromNib
{
    [self updatePreferences: self];
    [goButton setTitle: @"Start"];
    running = FALSE;
}

- (void) updateDisplay
{
    [minutesField setIntValue: (mySeconds / 60)];
    [secondsField setIntValue: mySeconds % 60];
}

- (void) update
{
    [self updateDisplay];

    if (running && mySeconds > 0) {
        mySeconds -= 1;

        myTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                   target: self
                                                 selector: @selector(update)
                                                 userInfo: nil
                                                  repeats: NO];
        [goButton setTitle: @"Reset"];
    } else {
        running = FALSE;
        [goButton setTitle: @"Start"];
    }
}

- (IBAction) start: (id)aSender
{
    mySeconds = mySecondsStart;

    if (running) {
        /* Stop the run and reset the timer */
        running = FALSE;
        [goButton setTitle: @"Start"];
        [self updateDisplay];
    } else {
        /* Start running */
        running = TRUE;
        [goButton setTitle: @"Reset"];
        [self update];
    }
}

- (IBAction) updatePreferences: (id)aSender
{
    mySecondsStart = [countdownFromField intValue];
}

@end
