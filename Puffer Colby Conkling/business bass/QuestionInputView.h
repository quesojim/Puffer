//
//  QuestionInputView.h
//  Study Game
//
//  Created by Colby Conkling on 1/11/14.
//  Copyright (c) 2014 Colby Conkling. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *Question1Var;


@interface QuestionInputView : UIViewController <UITextFieldDelegate> {

//Declaring TextFields

   IBOutlet  UITextField *Question1;
   IBOutlet  UITextField *Question1Correct;
   IBOutlet  UITextField *Question1Fill1;
   IBOutlet  UITextField *Question1Fill2;
   IBOutlet  UITextField *Question1Fill3;
   IBOutlet  UITextField *Question2;
   IBOutlet  UITextField *Question2Correct;
   IBOutlet  UITextField *Question2Fill1;
   IBOutlet  UITextField *Question2Fill2;
   IBOutlet  UITextField *Question2Fill3;
   IBOutlet  UITextField *Question3;
   IBOutlet  UITextField *Question3Correct;
   IBOutlet  UITextField *Question3Fill1;
   IBOutlet  UITextField *Question3Fill2;
   IBOutlet  UITextField *Question3Fill3;
   IBOutlet  UITextField *Question4;
   IBOutlet  UITextField *Question4Correct;
   IBOutlet  UITextField *Question4Fill1;
   IBOutlet  UITextField *Question4Fill2;
   IBOutlet  UITextField *Question4Fill3;


}


@end
