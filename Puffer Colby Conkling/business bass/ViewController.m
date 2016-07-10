//
//  ViewController.m
//  Business Bass
//
//  Created by Colby Conkling on 2/28/14.
//  Copyright (c) 2014 Colby Conkling. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"
#import <Social/Social.h>



@implementation ViewController

@synthesize AdView;

-(void) bannerViewDidLoadAd:(ADBannerView *)banner{
    
    [AdView setHidden:NO];
    
    NSLog(@"Showing");
    
    
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    
    [AdView setHidden:YES];
    
    NSLog(@"Hidden");
    
}



- (void)viewDidLoad


{
    
    [super viewDidLoad];
    
    AdView.delegate = self;
    
    [AdView setHidden:YES];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}




- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}



@end
