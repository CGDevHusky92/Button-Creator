//
//  SecondViewController.h
//  ButtonCreator
//
//  Created by Charles Gorectke on 7/5/11.
//  Copyright 2011 Gorectke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarCreatorViewController : UIViewController {
    UIButton *generateButton;
    
    UITextField *picNameField;
    UITextField *userNameField;
    UITextField *widthField;
    UITextField *heightField;
    
    UIScrollView *scrollView;
}
@property (nonatomic, retain) IBOutlet UIButton *generateButton;

@property (nonatomic, retain) IBOutlet UITextField *picNameField;
@property (nonatomic, retain) IBOutlet UITextField *userNameField;
@property (nonatomic, retain) IBOutlet UITextField *widthField;
@property (nonatomic, retain) IBOutlet UITextField *heightField;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

-(IBAction)generateButtonPressed:(id)sender;
-(void)createTabBarImageOnDesktopWithName:(NSString *)name onUserDesktop:(NSString *)user withWidth:(int)width andHeight:(int)height;

@end
