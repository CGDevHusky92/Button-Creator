//
//  ButtonCreatorViewController.m
//  ButtonCreator
//
//  Created by Charles Gorectke on 7/5/11.
//  Copyright 2011 Gorectke. All rights reserved.
//

#import "ButtonCreatorViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ButtonCreatorViewController
@synthesize generateButton;

@synthesize picNameField;
@synthesize userNameField;
@synthesize widthField;
@synthesize heightField;

@synthesize hueField;
@synthesize saturationField;
@synthesize brightnessField;
@synthesize alphaField;

@synthesize scrollView;
@synthesize scrollViewTwo;


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Button", @"Button");
        //self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    widthField.text = @"120";
    heightField.text = @"44";
    
    hueField.text = @"0.267";
    saturationField.text = @"1.000";
    brightnessField.text = @"0.667";
    alphaField.text = @"1.000";
}

-(void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [picNameField resignFirstResponder];
    [userNameField resignFirstResponder];
    [widthField resignFirstResponder];
    [heightField resignFirstResponder];
    [hueField resignFirstResponder];
    [saturationField resignFirstResponder];
    [brightnessField resignFirstResponder];
    [alphaField resignFirstResponder];
}

//UIKeyboardWillShowNotification
//Add Observer for this event ^
#pragma mark -
#pragma mark Responding to keyboard events

-(void)keyboardWillShow:(NSNotification *)notification {
    
}


-(void)keyboardWillHide:(NSNotification *)notification {
    [scrollView setScrollEnabled:YES];
    [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0) animated:YES];
    [scrollView setScrollEnabled:NO];
}

#pragma mark -
#pragma mark Text Field delegate methods

-(BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField {
    [scrollView setScrollEnabled:YES];
    
    if (aTextField == picNameField) {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0) animated:YES];
    } else if (aTextField == alphaField) {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 120) animated:YES];
    }
    
    [scrollView setScrollEnabled:NO];
    
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)aTextField {
    [aTextField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark ButtonCreator Methods

-(IBAction)generateButtonPressed:(id)sender {
    
    for (int x = 0; x < 2; x++) {
        //Running it twice fixes a change in subview bug
        //Quick and dirty fix....
        for (int i = 0; i < [scrollViewTwo.subviews count]; i++) {
            [[scrollViewTwo.subviews objectAtIndex:i] removeFromSuperview];
        }
        
        [self createButtonImageOnDesktopWithName:picNameField.text onUserDesktop:userNameField.text withWidth:[widthField.text intValue] andHeight:[heightField.text intValue] withHue:[hueField.text doubleValue] withSaturation:[saturationField.text doubleValue] withBrightness:[brightnessField.text doubleValue] withAlpha:[alphaField.text doubleValue]];
    }
    
    [picNameField resignFirstResponder];
    [userNameField resignFirstResponder];
    [widthField resignFirstResponder];
    [heightField resignFirstResponder];
    [hueField resignFirstResponder];
    [saturationField resignFirstResponder];
    [brightnessField resignFirstResponder];
    [alphaField resignFirstResponder];
}

-(void)createButtonImageOnDesktopWithName:(NSString *)name onUserDesktop:(NSString *)user withWidth:(int)width andHeight:(int)height withHue:(float)hue withSaturation:(float)sat withBrightness:(float)bright withAlpha:(float)alpha {
    //CODE CREATED BY Jonathan "Schwa" Wight I JUST WROTE THE LITTLE APP TO MAKE IT EXPANDABLE
    
    // Code to create a "Glass" button and render it to a png on your desktop.
    // Run this from the SIMULATOR and change my username to yours.
    // Update: This uses a private iPhone SDK. Do not use this code in your shipping app. Use it merely to generate the PNG file for you to use in a fake button.
    
    Class theClass = NSClassFromString(@"UIGlassButton");
    UIButton *theButton = [[theClass alloc] initWithFrame:CGRectMake(20, 20, width, height)];
    [theButton setValue:[UIColor colorWithHue:hue saturation:sat brightness:bright alpha:alpha] forKey:@"tintColor"];
    
    [self.scrollViewTwo addSubview:theButton];
    
    scrollViewTwo.contentSize = CGSizeMake(width + 20, height + 20);
    
    UIGraphicsBeginImageContext(theButton.frame.size);
    CGContextRef theContext = UIGraphicsGetCurrentContext();
    [[theButton layer] renderInContext:theContext];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    NSData *theData = UIImagePNGRepresentation(theImage);
    
    NSString *path = [NSString stringWithFormat:@"/Users/%@/Desktop/%@.png", user, name];
    
    [theData writeToFile:path atomically:NO];
    
    UIGraphicsEndImageContext();
}

@end
