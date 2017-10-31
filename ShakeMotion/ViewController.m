//
//  ViewController.m
//  ShakeMotion
//
//  Created by vikas on 05/10/17.
//  Copyright © 2017 vikas. All rights reserved.
//

#import "ViewController.h"
#import "UIView+RZViewActions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    [self animation1];
    
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
    if (motion == UIEventSubtypeMotionShake)
    {
        // your code
        NSLog(@"Detected  motionBegan ..........");
        
        [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
            //code with animation
            
            self.fruit1Img.frame = CGRectMake(355, 135, 132, 114);
            self.fruit2Img.frame = CGRectMake(220, 478, 261, 282);
            self.fruit3Img.frame = CGRectMake(557, 254, 227, 282);
            self.fruit4Img.frame = CGRectMake(255, 368, 49, 62);
            self.fruit5Img.frame = CGRectMake(344, 399, 62, 71);
            self.fruit6Img.frame = CGRectMake(457, 257, 78, 76);
            
        } completion:^(BOOL finished) {
            //code for completion
            NSLog(@"code completed");
        }];
    }
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        // your code
        NSLog(@"Detected motionEnded ..........");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)resetAction:(id)sender {
    
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
        //code with animation
        self.fruit1Img.frame = CGRectMake(314, 53, 40, 40);
        self.fruit2Img.frame = CGRectMake(385, 53, 40, 40);
        self.fruit3Img.frame = CGRectMake(460, 53, 40, 40);
        self.fruit4Img.frame = CGRectMake(530, 53, 40, 40);
        self.fruit5Img.frame = CGRectMake(598, 53, 40, 40);
        self.fruit6Img.frame = CGRectMake(670, 53, 40, 40);
        
    } completion:^(BOOL finished) {
        //code for completion
        NSLog(@"code completed");
    }];

}

-(void)animation1{
    
    RZViewAction *scaleUp = [RZViewAction action:^{
        self.animLbl.transform = CGAffineTransformScale(self.animLbl.transform, 1.3f, 1.3f);
    } withOptions:UIViewAnimationOptionCurveEaseOut duration:0.2];
    
    RZViewAction *scaleDown = [RZViewAction action:^{
        self.animLbl.transform = CGAffineTransformIdentity;
    } withDuration:0.15];
    
    RZViewAction *wait = [RZViewAction waitForDuration:0.7];
    
    RZViewAction *pulse = [RZViewAction sequence:@[scaleUp, scaleDown]];
    RZViewAction *heartbeat = [RZViewAction sequence:@[pulse, wait, pulse, wait, pulse]];
    
    [UIView rz_runAction:heartbeat withCompletion:^(BOOL finished) {
        NSLog(@"Animation complete!");
    }];
}
@end
