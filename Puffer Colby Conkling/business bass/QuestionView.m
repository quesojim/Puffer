//
//  QuestionView.m
//  Bass Class
//
//  Created by Colby Conkling on 3/1/14.
//  Copyright (c) 2014 Colby Conkling. All rights reserved.
//

#import "QuestionView.h"
#import "ViewController.h"

@interface QuestionView ()

@end

@implementation QuestionView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor redColor];

    Answer1Correct = YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
