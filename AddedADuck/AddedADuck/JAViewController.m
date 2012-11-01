//
//  JAViewController.m
//  AddedADuck
//
//  Created by Robert Shoemate on 8/21/12.
//  Copyright (c) 2012 Robert Shoemate. All rights reserved.
//

#import "JAViewController.h"

@interface JAViewController ()

@end

@implementation JAViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)addDuck:(id)sender {
    UIImage *bottomImage = self.imageView.image;
    UIImage *topImage = [UIImage imageNamed:@"duck.png"];
    
    CGSize newSize = CGSizeMake(bottomImage.size.width, bottomImage.size.height);
    UIGraphicsBeginImageContext(newSize);
    
    [bottomImage drawInRect:CGRectMake(0, 0, bottomImage.size.width, bottomImage.size.height)];
    [topImage drawInRect:CGRectMake(bottomImage.size.width/4, bottomImage.size.height - bottomImage.size.height/2, bottomImage.size.width/2, bottomImage.size.height/2) blendMode:kCGBlendModeNormal alpha:1];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    self.imageView.image = img;
    
    UIGraphicsEndImageContext();
}

- (IBAction)savePicture:(id)sender {
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Saved!" message:@"Saved!" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.imageView.image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
}

@end
