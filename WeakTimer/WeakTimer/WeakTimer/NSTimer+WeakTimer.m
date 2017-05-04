//
//  NSTimer+WeakTimer.m
//  WeakTimer
//
//  Created by Fengtf on 2017/5/4.
//  Copyright © 2017年 ftf. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

@implementation NSTimer (WeakTimer)

+ (NSTimer *)wk_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                       repeats:(BOOL)repeats
                                  handlerBlock:(void(^)())handler
{
    return [self scheduledTimerWithTimeInterval:timeInterval
                                         target:self
                                       selector:@selector(handlerBlockInvoke:)
                                       userInfo:[handler copy]
                                        repeats:repeats];
}

+ (void)handlerBlockInvoke:(NSTimer *)timer
{
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

@end
