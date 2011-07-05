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

-(void)createTabBarImageOnDesktopWithName:(NSString *)name onUserDesktop:(NSString *)user withWidth:(int)width andHeight:(int)height {
    
    //TabBar or custome generator.... to generate a TabBar for a Mac App or something else...
    //Good Mac width
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(10, 10, 400, 44)];
    UIGraphicsBeginImageContext(tabBar.frame.size);
    CGContextRef theContext = UIGraphicsGetCurrentContext();
    [[tabBar layer] renderInContext:theContext];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    NSData *theData = UIImagePNGRepresentation(theImage);
    
    NSString *path = [NSString stringWithFormat:@"/Users/%@/Desktop/TabBar.png", user];
    
    [theData writeToFile:path atomically:NO];
    
    UIGraphicsEndImageContext();
}

@end
