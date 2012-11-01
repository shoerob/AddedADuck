//
//  JAViewController.h
//  AddedADuck
//
//  Created by Robert Shoemate on 8/21/12.
//  Copyright (c) 2012 Robert Shoemate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JAViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePicture:(id)sender;
- (IBAction)addDuck:(id)sender;
- (IBAction)savePicture:(id)sender;

@end
