//
//  ViewController.h
//  ShakeMotion
//
//  Created by vikas on 05/10/17.
//  Copyright © 2017 vikas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

double currentMaxAccelX;
double currentMaxAccelY;
double currentMaxAccelZ;
double currentMaxRotX;
double currentMaxRotY;
double currentMaxRotZ;

@interface ViewController : UIViewController

- (IBAction)resetAction:(id)sender;

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (weak, nonatomic) IBOutlet UIImageView *fruit1Img;
@property (weak, nonatomic) IBOutlet UIImageView *fruit2Img;
@property (weak, nonatomic) IBOutlet UIImageView *fruit3Img;
@property (weak, nonatomic) IBOutlet UIImageView *fruit4Img;
@property (weak, nonatomic) IBOutlet UIImageView *fruit5Img;
@property (weak, nonatomic) IBOutlet UIImageView *fruit6Img;
@property (weak, nonatomic) IBOutlet UILabel *animLbl;
@end

