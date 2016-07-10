//
//  QuestionInputView.m
//  Study Game
//
//  Created by Colby Conkling on 1/11/14.
//  Copyright (c) 2014 Colby Conkling. All rights reserved.
//

#import "QuestionInputView.h"
#import "AppDelegate.h"

@interface QuestionInputView ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation QuestionInputView



-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.myScrollView layoutIfNeeded];
     self.myScrollView.contentSize = self.contentView.bounds.size;
}


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
    
    
    [super viewDidLoad];
	
    // Do any additional setup after loading the view.
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ChangeValuesButton:(id)sender {
    
    Question1Var = Question1.text;
    
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
@end
