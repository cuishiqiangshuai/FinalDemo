//
//  ViewController.m
//  06-FinalDemo
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touchDown:(id)sender {
    //1.创建一个串行队列
    dispatch_queue_t queue=dispatch_queue_create("com.qingyun.www", NULL);
    dispatch_async(queue, ^{
       //2.1执行一个等待操作
        [NSThread   sleepForTimeInterval:1];
        NSLog(@"=====1");
       //在串行队列任务内,派发一个同步任务,势必会造成死锁
      dispatch_async(queue, ^{
          [NSThread sleepForTimeInterval:2];
          NSLog(@"=====2");
      });
        
      dispatch_async(queue, ^{
          [NSThread sleepForTimeInterval:.5];
          NSLog(@"====.5");
      });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
