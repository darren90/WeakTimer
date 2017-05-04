# WeakTimer
Use this, this will not happen NSTimer Retain Cycle

Solve the NSTimer method of using the system, leading to the Retain Cycle and resources can release

you can simple use like this:

    __weak typeof(self)weakSelf = self;
    self.timer = [NSTimer wk_scheduledTimerWithTimeInterval:1.0 repeats:YES handlerBlock:^void(void){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        
        //TO-DO...
    }];
	[[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
