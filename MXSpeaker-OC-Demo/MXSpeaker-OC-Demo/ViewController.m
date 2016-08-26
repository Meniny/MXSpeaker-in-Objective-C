//
//  ViewController.m
//  MXSpeaker-OC-Demo
//
//  Created by Meniny on 16/8/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "ViewController.h"
#import "MXSpeaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    uint32_t random = arc4random_uniform(9999) + 200;
    [MXSpeaker speakWithFormat:@"Greetings! %zd", random];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
