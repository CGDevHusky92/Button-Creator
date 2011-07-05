//
//  SecondViewController.m
//  ButtonCreator
//
//  Created by Charles Gorectke on 7/5/11.
//  Copyright 2011 Gorectke. All rights reserved.
//

#import "TabBarCreatorViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation TabBarCreatorViewController
@synthesize generateButton;

@synthesize picNameField;
@synthesize userNameField;
@synthesize widthField;
@synthesize heightField;

@synthesize scrollView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"TabBar", @"TabBar");
        //self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark ButtonCreator Methods

-(IBAction)generateButtonPressed:(id)sender {
    
    for (int x = 0; x < 2; x++) {
        //Running it twice fixes a change in subview bug
        //Quick and dirty fix....
        for (int i = 0; i < [scrollView.subviews count]; i++) {
            [[scrollView.subviews objectAtIndex:i] removeFromSuperview];
        }
        
        [self createTabBarImageOnDesktopWithName:picNameField.text onUserDesktop:userNameField.text withWidth:[widthField.text intValue] andHeight:[heightField.text intValue]];
    }
    
    [picNameField resignFirstResponder];
    [userNameField resignFirstResponder];
    [widthField resignFirstResponder];
    [heightField resignFirstResponder];
}

-(void)createTabBarImageOnDesktopWithName:(NSString *)name onUserDesktop:(NSString *)user withWidth:(int)width andHeight:(int)height {
    
    //TabBar or custome generator.... to generate a TabBar for a Mac App or something else...
    //Good Mac width
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(10, 10, width, height)];
    UIGraphicsBeginImageContext(tabBar.frame.size);
    CGContextRef theContext = UIGraphicsGetCurrentContext();
    [[tabBar layer] renderInContext:theContext];
    
    [self.scrollView addSubview:tabBar];
    
    scrollView.contentSize = CGSizeMake(width + 20, height + 20);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    NSData *theData = UIImagePNGRepresentation(theImage);
    
    NSString *path = [NSString stringWithFormat:@"/Users/%@/Desktop/%@.png", user, name];
    
    [theData writeToFile:path atomically:NO];
    
    UIGraphicsEndImageContext();
}

@end
