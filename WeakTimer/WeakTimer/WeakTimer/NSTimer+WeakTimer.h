//
//  NSTimer+WeakTimer.h
//  WeakTimer
//
//  Created by Fengtf on 2017/5/4.
//  Copyright © 2017年 ftf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WeakTimer)


+ (NSTimer *)wk_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                       repeats:(BOOL)repeats
                                  handlerBlock:(void(^)())handler;

@end
