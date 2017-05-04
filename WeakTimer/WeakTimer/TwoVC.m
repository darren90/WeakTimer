//
//  TwoVC.m
//  WeakTimer
//
//  Created by Fengtf on 2017/5/4.
//  Copyright © 2017年 ftf. All rights reserved.
//

#import "TwoVC.h"

#import "NSTimer+WeakTimer.h"

@interface TwoVC ()

@property (nonatomic,strong)NSTimer * timer;

@end

@implementation TwoVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"TwoVC";

    [self addTiemrWeak];
}


-(void)addTiemr{
    if (_timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
        //        [[NSRunLoop currentRunLoop] addTimer:self forMode:NSRunLoopCommonModes];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}


-(void)addTiemrWeak{
    __weak typeof(self)weakSelf = self;
    self.timer = [NSTimer wk_scheduledTimerWithTimeInterval:1.0 repeats:YES handlerBlock:^void(void){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf action];
    }];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)action{
    NSLog(@"---action----");
}

-(void)destoryTimer{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        NSLog(@"--TwoVC--destoryTimer--");
    }
}

-(void)dealloc{
    [self destoryTimer];
    NSLog(@"--TwoVC--dealloc--");
}


@end
