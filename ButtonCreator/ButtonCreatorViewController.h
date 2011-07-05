//
//  ButtonCreatorViewController.h
//  ButtonCreator
//
//  Created by Charles Gorectke on 7/5/11.
//  Copyright 2011 Gorectke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonCreatorViewController : UIViewController <UITextFieldDelegate> {
    UIButton *generateButton;
    
    UITextField *picNameField;
    UITextField *userNameField;
    UITextField *widthField;
    UITextField *heightField;
    
    UITextField *hueField;
    UITextField *saturationField;
    UITextField *brightnessField;
    UITextField *alphaField;
    
    UIScrollView *scrollView;
    UIScrollView *scrollViewTwo;
}
@property (nonatomic, retain) IBOutlet UIButton *generateButton;

@property (nonatomic, retain) IBOutlet UITextField *picNameField;
@property (nonatomic, retain) IBOutlet UITextField *userNameField;
@property (nonatomic, retain) IBOutlet UITextField *widthField;
@property (nonatomic, retain) IBOutlet UITextField *heightField;

@property (nonatomic, retain) IBOutlet UITextField *hueField;
@property (nonatomic, retain) IBOutlet UITextField *saturationField;
@property (nonatomic, retain) IBOutlet UITextField *brightnessField;
@property (nonatomic, retain) IBOutlet UITextField *alphaField;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollViewTwo;

-(IBAction)generateButtonPressed:(id)sender;
-(void)createButtonImageOnDesktopWithName:(NSString *)name onUserDesktop:(NSString *)user withWidth:(int)width andHeight:(int)height withHue:(float)hue withSaturation:(float)sat withBrightness:(float)bright withAlpha:(float)alpha;

@end
