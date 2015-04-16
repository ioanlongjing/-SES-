//
//  ViewController.m
//  SNS
//
//  Created by Mac on 4/9/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doURLFetch:(id)sender {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"http://10.50.169.160:8080/data"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error!=nil) NSLog(@"Completed: %@", error);
        else {
            NSString *newStr = [NSString stringWithUTF8String:[data bytes]];
            // self.fetchedDataLabel.text = newStr; // does not work because it's on the background thread
            [_fetchDatalabel performSelectorOnMainThread:@selector(setText:) withObject:(newStr) waitUntilDone:NO];
            // NSLog(@"data: %@", newStr);
        }
    }];
    [task resume];
}

NSTimer *fetchTimer = nil;

- (IBAction)doFetchloop:(id)sender {
    if (fetchTimer==nil){
        _fetchButton.enabled = NO;
        fetchTimer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                      target:self
                                                    selector:@selector(doURLFetch:)
                                                    userInfo:nil
                                                     repeats:YES];
        [_loopButton setTitle:@"Stop Looping" forState:UIControlStateNormal];
    } else {
        [fetchTimer invalidate];
        fetchTimer = nil;
        _fetchButton.enabled =YES;
        [_loopButton setTitle:@"Loop" forState:UIControlStateNormal];
    }



}
@end
