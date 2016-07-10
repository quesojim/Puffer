//
//  QuestionScene.m
//  Bass Class
//
//  Created by Colby Conkling on 3/1/14.
//  Copyright (c) 2014 Colby Conkling. All rights reserved.
//

#import "QuestionScene.h"
#import "MyScene.h"
#import "QuestionInputView.h"

@interface QuestionScene ()<SKPhysicsContactDelegate> {
    
    //Declaring Variables
    
    SKSpriteNode *Answer1Button;
    SKSpriteNode *Answer2Button;
    SKSpriteNode *Answer3Button;
    SKSpriteNode *Answer4Button;
    SKSpriteNode *Bubbles;
    SKSpriteNode *Bubbles2;
    SKLabelNode  *HeaderLabel;
    SKLabelNode  *HeaderLabel2;
    SKLabelNode  *Answer1Label;
    SKLabelNode  *Answer2Label;
    SKLabelNode  *Answer3Label;
    SKLabelNode  *Answer4Label;
    SKLabelNode  *QuestionLabel1;
    SKLabelNode  *QuestionLabel2;
    SKLabelNode *CorrectLabel1;
    SKLabelNode *CorrectLabel2;
    SKLabelNode *CorrectLabel3;
    SKLabelNode *CorrectLabel4;
    SKLabelNode *IncorrectLabel1;
    SKLabelNode *IncorrectLabel2;
    SKLabelNode *IncorrectLabel3;
    SKLabelNode *IncorrectLabel4;
    NSTimer *CorrectLabel1PopOutTimer;
    NSTimer *CorrectLabel2PopOutTimer;
    NSTimer *CorrectLabel3PopOutTimer;
    NSTimer *CorrectLabel4PopOutTimer;
    NSTimer *IncorrectLabel1PopOutTimer;
    NSTimer *IncorrectLabel2PopOutTimer;
    NSTimer *IncorrectLabel3PopOutTimer;
    NSTimer *IncorrectLabel4PopOutTimer;
    NSTimer *NextQuestionTimer;
    NSTimer *TransitionTimer;
    NSTimer *MoveBubblesTimer;
    NSTimer *MoveBubblesTimer2;
    BOOL    Answer1Correct;
    BOOL    Answer2Correct;
    BOOL    Answer3Correct;
    BOOL    Answer4Correct;

}

@end

@implementation QuestionScene

-(void) didMoveToView:(SKView *)view
{
    
[self createSceneContents];

    
}

-(void) createSceneContents
{
    
    
    self.scaleMode = SKSceneScaleModeAspectFill;
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"BlueBackground"];
    background.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    
    [self addChild:background];
    
    background.zPosition = 0.0;
    
    Bubbles = [SKSpriteNode spriteNodeWithImageNamed:@"Bubbles"];
    
    Bubbles.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    Bubbles.size = CGSizeMake(320, 480);
    
    [self addChild:Bubbles];
    
    MoveBubblesTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(MoveBubbles1) userInfo:nil repeats:YES];
    
    Bubbles2 = [SKSpriteNode spriteNodeWithImageNamed:@"Bubbles"];
    
    Bubbles2.position = CGPointMake(CGRectGetMidX(self.frame), 0);
    
    Bubbles2.size = CGSizeMake(320, 480);
    
    [self addChild:Bubbles2];
    
    Bubbles.zPosition = 0.2;
    
    Bubbles2.zPosition = 0.2;
    
    MoveBubblesTimer2 = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(MoveBubbles2) userInfo:nil repeats:YES];

    
    
        //Creating Answer Labels and objects
    
        Answer1Button = [SKSpriteNode spriteNodeWithImageNamed:@"AnswerButton.png"];
    
        Answer1Button.position = CGPointMake(161, 110);
    
        Answer1Button.name = @"Answer1Button";//how the node is identified later
    
        Answer1Button.zPosition = 1.0;
    
        Answer1Button.size = CGSizeMake(315, 61);
    
        [self addChild:Answer1Button];
    
        Answer2Button = [SKSpriteNode spriteNodeWithImageNamed:@"AnswerButton.png"];
    
        Answer2Button.position = CGPointMake(161, 185);
    
        Answer2Button.name = @"Answer2Button";//how the node is identified later
    
        Answer2Button.zPosition = 1.0;
    
        Answer2Button.size = CGSizeMake(315, 61);
    
        [self addChild:Answer2Button];
    
        Answer3Button = [SKSpriteNode spriteNodeWithImageNamed:@"AnswerButton.png"];
    
        Answer3Button.position = CGPointMake(161, 260);
    
        Answer3Button.name = @"Answer3Button";//how the node is identified later
    
        Answer3Button.zPosition = 1.0;
    
        Answer3Button.size = CGSizeMake(315, 61);
    
        [self addChild:Answer3Button];
    
        Answer4Button = [SKSpriteNode spriteNodeWithImageNamed:@"AnswerButton.png"];
    
        Answer4Button.position = CGPointMake(161, 335);
    
        Answer4Button.name = @"Answer4Button";//how the node is identified later
    
        Answer4Button.zPosition = 1.0;
    
        Answer4Button.size = CGSizeMake(315, 61);
    
        [self addChild:Answer4Button];
    
        Answer1Label = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    
        Answer1Label.name = @"Answer1Label";
    
        Answer1Label.position = CGPointMake(158.5, 104);
    
        Answer1Label.fontColor = [SKColor blackColor];
    
        Answer1Label.zPosition = 100;
    
        [self addChild:Answer1Label];
    
        Answer2Label = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    
        Answer2Label.name = @"Answer2Label";
    
        Answer2Label.position = CGPointMake(158.5, 179);
    
        Answer2Label.fontColor = [SKColor blackColor];
    
        Answer2Label.zPosition = 100;
    
        [self addChild:Answer2Label];

        Answer3Label = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    
        Answer3Label.name = @"Answer3Label";
    
        Answer3Label.position = CGPointMake(158.5, 254);
    
        Answer3Label.fontColor = [SKColor blackColor];
    
        Answer3Label.zPosition = 100;
    
        [self addChild:Answer3Label];
    
        Answer4Label = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    
        Answer4Label.name = @"Answer4Label";
    
        Answer4Label.position = CGPointMake(158.5, 329);
    
        Answer4Label.fontColor = [SKColor blackColor];
    
        Answer4Label.zPosition = 100;
    
        [self addChild:Answer4Label];
    
        QuestionLabel1 = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    
        QuestionLabel1.position = CGPointMake(158.5, 440);
    
        QuestionLabel1.zPosition = 100;
    
        QuestionLabel1.fontSize = (18);
    
        [self addChild: QuestionLabel1];
    
        QuestionLabel2 = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    
        QuestionLabel2.position = CGPointMake(158.5, 408);
    
        QuestionLabel2.zPosition = 100;
    
        QuestionLabel2.fontSize = (18);
    
        [self addChild: QuestionLabel2];
    
        HeaderLabel = [SKLabelNode labelNodeWithFontNamed:@"Monaco"];
    
        HeaderLabel. position = CGPointMake (158.5, 25);
    
        HeaderLabel.zPosition = 100;
    
        HeaderLabel.fontSize = (23);
    
        HeaderLabel.fontColor = [SKColor redColor];
    
        HeaderLabel.text = @"Answer correctly to play again.";
    
        [self addChild:HeaderLabel];
    
        CorrectLabel1 = [SKLabelNode labelNodeWithFontNamed:@"Copperplate-Light"];
    
        CorrectLabel1.text = @"Correct!";
    
        CorrectLabel1.position = CGPointMake(158.5, 100);
    
        CorrectLabel1.zPosition = 100;
    
        CorrectLabel1.fontColor = [SKColor greenColor];
    
        [self addChild:CorrectLabel1];
    
        CorrectLabel2 = [SKLabelNode labelNodeWithFontNamed:@"Copperplate-Light"];
    
        CorrectLabel2.text = @"Correct!";
    
        CorrectLabel2.position = CGPointMake(158.5, 175);
    
        CorrectLabel2.zPosition = 100;
    
        CorrectLabel2.fontColor = [SKColor greenColor];
    
        [self addChild:CorrectLabel2];
    
        CorrectLabel3 = [SKLabelNode labelNodeWithFontNamed:@"Copperplate-Light"];
    
        CorrectLabel3.text = @"Correct!";
    
        CorrectLabel3.position = CGPointMake(158.5, 250);
    
        CorrectLabel3.zPosition = 100;
    
        CorrectLabel3.fontColor = [SKColor greenColor];
    
        [self addChild:CorrectLabel3];
    
        CorrectLabel4 = [SKLabelNode labelNodeWithFontNamed:@"Copperplate-Light"];
    
        CorrectLabel4.text = @"Correct!";
    
        CorrectLabel4.position = CGPointMake(158.5, 325);
    
        CorrectLabel4.zPosition = 100;
    
        CorrectLabel4.fontColor = [SKColor greenColor];
    
        [self addChild:CorrectLabel4];
    
        IncorrectLabel1 = [SKLabelNode labelNodeWithFontNamed:@"Copperplate-Light"];
    
        IncorrectLabel1.text = @"Incorrect!";
    
        IncorrectLabel1.position = CGPointMake(158.5, 100);
    
        IncorrectLabel1.zPosition = 100;
    
        IncorrectLabel1.fontColor = [SKColor redColor];
    
        [self addChild: IncorrectLabel1];
    
        IncorrectLabel2 = [SKLabelNode labelNodeWithFontNamed:@"Copperplate-Light"];
    
        IncorrectLabel2.text = @"Incorrect!";
    
        IncorrectLabel2.position = CGPointMake(158.5, 175);
    
        IncorrectLabel2.zPosition = 100;
    
        IncorrectLabel2.fontColor = [SKColor redColor];
    
        [self addChild: IncorrectLabel2];
    
        IncorrectLabel3 = [SKLabelNode labelNodeWithFontNamed:@"Copperplate-Light"];
    
        IncorrectLabel3.text = @"Incorrect!";
    
        IncorrectLabel3.position = CGPointMake(158.5, 250);
    
        IncorrectLabel3.zPosition = 100;
    
        IncorrectLabel3.fontColor = [SKColor redColor];
    
        [self addChild: IncorrectLabel3];
    
        IncorrectLabel4 = [SKLabelNode labelNodeWithFontNamed:@"Copperplate-Light"];
    
        IncorrectLabel4.text = @"Incorrect!";
    
        IncorrectLabel4.position = CGPointMake(158.5, 325);
    
        IncorrectLabel4.zPosition = 100;
    
        IncorrectLabel4.fontColor = [SKColor redColor];
    
        [self addChild: IncorrectLabel4];
    

        CorrectLabel1.hidden = YES;
    
        CorrectLabel2.hidden = YES;
    
        CorrectLabel3.hidden = YES;
    
        CorrectLabel4.hidden = YES;
    
        IncorrectLabel1.hidden = YES;
    
        IncorrectLabel2.hidden = YES;
    
        IncorrectLabel3.hidden = YES;
    
        IncorrectLabel4.hidden = YES;
    
        Answer1Label.fontSize = (15);
    
        Answer2Label.fontSize = (15);
    
        Answer3Label.fontSize = (15);
    
        Answer4Label.fontSize = (15);
    
        Answer1Correct = NO;
    
        Answer2Correct = NO;
    
        Answer3Correct = NO;
    
        Answer4Correct = NO;
    
        [self NextQuestion];
}

//Handling touch events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //Tapping answers
    
    if (([node.name isEqualToString:@"Answer1Button"]) || ([node.name isEqualToString:@"Answer1Label"])) {
        
        if (Answer1Correct == YES){
            
            [self CorrectAnswer1];
        }
        
        if (Answer1Correct == NO){
            
            [self IncorrectAnswer1];
        }
    }
    
    if (([node.name isEqualToString:@"Answer2Button"]) || ([node.name isEqualToString:@"Answer2Label"])) {
        
        if (Answer2Correct == YES){
            
            [self CorrectAnswer2];
        }
        
        if (Answer2Correct == NO){
            
            [self IncorrectAnswer2];
        }
    }
    
    if (([node.name isEqualToString:@"Answer3Button"]) || ([node.name isEqualToString:@"Answer3Label"])) {
        
        if (Answer3Correct == YES){
            
            [self CorrectAnswer3];
        }
        
        if (Answer3Correct == NO){
            
            [self IncorrectAnswer3];
        }
    }
    
    if (([node.name isEqualToString:@"Answer4Button"]) || ([node.name isEqualToString:@"Answer4Label"])) {
        
        if (Answer4Correct == YES){
            
            [self CorrectAnswer4];
        }
        
        if (Answer4Correct == NO){
            
            [self IncorrectAnswer4];
        }
    }

}

//Run if answer is correct.  Correct label pops out, label and button disappears and transitions back to game.

-(void) CorrectAnswer1{
        
    Answer1Label.hidden = YES;
        
    Answer1Button.hidden = YES;
        
    CorrectLabel1.hidden = NO;
        
    CorrectLabel1PopOutTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(CorrectLabel1PopOut) userInfo:nil repeats:NO];
        
}

-(void) CorrectAnswer2{
    
    Answer2Label.hidden = YES;
    
    Answer2Button.hidden = YES;
    
    CorrectLabel2.hidden = NO;
    
    CorrectLabel2PopOutTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(CorrectLabel2PopOut) userInfo:nil repeats:NO];
    
    
}

-(void) CorrectAnswer3{
    
    Answer3Label.hidden = YES;
    
    Answer3Button.hidden = YES;
    
    CorrectLabel3.hidden = NO;
    
    CorrectLabel3PopOutTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(CorrectLabel3PopOut) userInfo:nil repeats:NO];
    
}

-(void) CorrectAnswer4{
    
    Answer4Label.hidden = YES;
    
    Answer4Button.hidden = YES;
    
    CorrectLabel4.hidden = NO;
    
    CorrectLabel4PopOutTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(CorrectLabel4PopOut) userInfo:nil repeats:NO];
    
}

//Called when an answer is incorrect.  Incorrect label pops out, label and button disappears, and a new question is chosen.

-(void) IncorrectAnswer1{
    
    Answer1Label.hidden = YES;
    
    Answer1Button.hidden = YES;
    
    IncorrectLabel1.hidden = NO;
    
    CorrectLabel1.hidden = YES;
    
    IncorrectLabel1PopOutTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(IncorrectLabel1PopOut) userInfo:nil repeats:NO];
    
}

-(void) IncorrectAnswer2{
    
    Answer2Label.hidden = YES;
    
    Answer2Button.hidden = YES;
    
    IncorrectLabel2.hidden = NO;
    
    CorrectLabel1.hidden = YES;
    
    IncorrectLabel2PopOutTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(IncorrectLabel2PopOut) userInfo:nil repeats:NO];
    
}

-(void) IncorrectAnswer3{
    
    Answer3Label.hidden = YES;
    
    Answer3Button.hidden = YES;
    
    IncorrectLabel3.hidden = NO;
    
    IncorrectLabel3PopOutTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(IncorrectLabel3PopOut) userInfo:nil repeats:NO];
    
}

-(void) IncorrectAnswer4{
    
    Answer4Label.hidden = YES;
    
    Answer4Button.hidden = YES;
    
    IncorrectLabel4.hidden = NO;
    
    IncorrectLabel4PopOutTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(IncorrectLabel4PopOut) userInfo:nil repeats:NO];
    
}


-(void) CorrectLabel1PopOut{
    
    [CorrectLabel1 runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:0.5 duration:0.1]]]];
    
    TransitionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(Transition) userInfo:nil repeats:NO];

}

-(void) CorrectLabel2PopOut{
    
    [CorrectLabel2 runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:0.5 duration:0.1]]]];
    
    TransitionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(Transition) userInfo:nil repeats:NO];
    
}

-(void) CorrectLabel3PopOut{
    
    [CorrectLabel3 runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:0.5 duration:0.1]]]];
    
    TransitionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(Transition) userInfo:nil repeats:NO];
    
}

-(void) CorrectLabel4PopOut{
    
    [CorrectLabel4 runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:0.5 duration:0.1]]]];
    
    TransitionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(Transition) userInfo:nil repeats:NO];
    
}

-(void) IncorrectLabel1PopOut{
    
    [IncorrectLabel1 runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:0.5 duration:0.1]]]];
    
    NextQuestionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(NextQuestion) userInfo:nil repeats:NO];
    
}

-(void) IncorrectLabel2PopOut{
    
    [IncorrectLabel2 runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:0.5 duration:0.1]]]];
    
    NextQuestionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(NextQuestion) userInfo:nil repeats:NO];
    
}

-(void) IncorrectLabel3PopOut{
    
    [IncorrectLabel3 runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:0.5 duration:0.1]]]];
    
    NextQuestionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(NextQuestion) userInfo:nil repeats:NO];
    
}

-(void) IncorrectLabel4PopOut{
    
    [IncorrectLabel4 runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:0.5 duration:0.1]]]];
    
    NextQuestionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(NextQuestion) userInfo:nil repeats:NO];
    
}

//Choosing a random question to ask

-(void)NextQuestion{
    
    int y = arc4random() %3;
    int x = 0;
    
    if ((y == 0) && (x != 0)){
    
    [self HideAllLabels];
    [self Question1];
     
        x = 0;
    
    }
    
    if ((y == 0) && (x == 0)){
        
        y = arc4random() %3;
    }
    
    if ((y == 1) && (x != 1)){
        
        [self HideAllLabels];
        [self Question2];
        
        x = 1;
    
    }
    
    if ((y == 1) && (x == 1)){
        
        y = arc4random()%3;
    }
    
    if ((y == 2) && (x != 2)){
        
        [self HideAllLabels];
        [self Question3];
        
        x = 2;
        
    }
    
    if ((y == 2) && (x == 2)){
        
        y = arc4random()%3;
        
    }
    
    if ((y == 3) && (x != 3)){
        
        [self HideAllLabels];
        [self Question4];
        
        x = 3;
        
    }
    
    if ((y == 3) && (x == 3)){
        
        y = arc4random()%3;
        
    }

}

//Hding correct and incorrect labels after a question is answered.

-(void)HideAllLabels{
    
    Answer1Label.hidden = NO;
    Answer2Label.hidden = NO;
    Answer3Label.hidden = NO;
    Answer4Label.hidden = NO;
    Answer1Button.hidden = NO;
    Answer2Button.hidden = NO;
    Answer3Button.hidden = NO;
    Answer4Button.hidden = NO;
    CorrectLabel1.hidden = YES;
    CorrectLabel2.hidden = YES;
    CorrectLabel3.hidden = YES;
    CorrectLabel4.hidden = YES;
    IncorrectLabel1.hidden = YES;
    IncorrectLabel2.hidden = YES;
    IncorrectLabel3.hidden = YES;
    IncorrectLabel4.hidden = YES;
    
}

//The questions to be asked

-(void)Question1{
    
    QuestionLabel1.text = Question1Var;
    QuestionLabel2.text = @"_______ communicators";
    Answer1Label.text = @"Poor";
    Answer2Label.text = @"Indifferent";
    Answer3Label.text = @"Perfect";
    Answer4Label.text = @"Good";
    Answer1Correct = YES;
    Answer2Correct = NO;
    Answer3Correct = NO;
    Answer4Correct = NO;

}

-(void)Question2{
    
    QuestionLabel1.text = @"The latin word ";
    QuestionLabel2.text = @"communis means:";
    Answer1Label.text = @"Community";
    Answer2Label.text = @"Common";
    Answer3Label.text = @"Communism";
    Answer4Label.text = @"Commute";
    Answer2Correct = YES;
    Answer1Correct = NO;
    Answer3Correct = NO;
    Answer4Correct = NO;
    
}

-(void)Question3{
    
    QuestionLabel1.text = @"Effective communication";
    QuestionLabel2.text = @"is a _____ way process.";
    Answer1Label.text = @"One Way";
    Answer2Label.text = @"One and Two Way";
    Answer3Label.text = @"Three";
    Answer4Label.text = @"Linear";
    Answer2Correct = YES;
    Answer1Correct = NO;
    Answer3Correct = NO;
    Answer4Correct = NO;
    
}

-(void)Question4{
    
    QuestionLabel1.text = @"Human communication ";
    QuestionLabel2.text = @"is essentially: ";
    Answer1Label.text = @"Emotional";
    Answer2Label.text = @"Imperfect";
    Answer3Label.text = @"Perfect";
    Answer4Label.text = @"Short-Lived";
    Answer2Correct = YES;
    Answer1Correct = NO;
    Answer3Correct = NO;
    Answer4Correct = NO;
    
}

-(void)Question5{
    
    QuestionLabel1.text = @"Which of these is not one of ";
    QuestionLabel2.text = @"the 7 C's of communication?";
    Answer1Label.text = @"Clarity";
    Answer2Label.text = @"Correctness";
    Answer3Label.text = @"Conciseness";
    Answer4Label.text = @"Character";
    Answer4Correct = YES;
    Answer3Correct = NO;
    Answer2Correct = NO;
    Answer1Correct = NO;
}

-(void)Question6{
    
    QuestionLabel1.text = @"Which organizational structure ";
    QuestionLabel2.text = @"do employees report to 2 managers?";
    Answer1Label.text = @"Virtual";
    Answer2Label.text = @"Matrix";
    Answer3Label.text = @"Modern";
    Answer4Label.text = @"Network";
    Answer4Correct = NO;
    Answer3Correct = NO;
    Answer2Correct = YES;
    Answer1Correct = NO;
}

-(void)Question7{
    
    QuestionLabel1.text = @"Stakeholders affected by ";
    QuestionLabel2.text = @"quality of business include:";
    Answer1Label.text = @"Customers";
    Answer2Label.text = @"Employees";
    Answer3Label.text = @"Shareholders";
    Answer4Label.text = @"All Of These";
    Answer4Correct = YES;
    Answer3Correct = NO;
    Answer2Correct = NO;
    Answer1Correct = NO;
}

-(void)Question8{
    
    QuestionLabel1.text = @"Communication is the";
    QuestionLabel2.text = @"process of:";
    Answer1Label.text = @"Transferring Information";
    Answer2Label.text = @"Listening Actively";
    Answer3Label.text = @"Writing Messages";
    Answer4Label.text = @"Speaking to Others";
    Answer4Correct = NO;
    Answer3Correct = NO;
    Answer2Correct = NO;
    Answer1Correct = YES;
}

-(void)Question9{
    
    QuestionLabel1.text = @"In the first step of the";
    QuestionLabel2.text = @"communication process, the sender";
    Answer1Label.text = @"Decides What to Say";
    Answer2Label.text = @"Has an Idea";
    Answer3Label.text = @"Evaluates His or Her options";
    Answer4Label.text = @"Chooses a Medium";
    Answer4Correct = NO;
    Answer3Correct = NO;
    Answer2Correct = YES;
    Answer1Correct = NO;
}

-(void)Question10{
    
    QuestionLabel1.text = @"Every organization ";
    QuestionLabel2.text = @"has a(n)";
    Answer1Label.text = @"Intranet";
    Answer2Label.text = @"Extranet";
    Answer3Label.text = @"Informal Communication Network";
    Answer4Label.text = @"Flat Structure";
    Answer4Correct = NO;
    Answer3Correct = YES;
    Answer2Correct = NO;
    Answer1Correct = NO;
}

-(void)Question11{
    
    QuestionLabel1.text = @"In organizations, the rumor";
    QuestionLabel2.text = @"mill tends to be active when";
    Answer1Label.text = @"Employees are Satisfied With Their Jobs";
    Answer2Label.text = @"Employees are Wasting Company Time";
    Answer3Label.text = @"Formal Communication Isn't Enough";
    Answer4Label.text = @"There is a lack of gender balance";
    Answer4Correct = NO;
    Answer3Correct = YES;
    Answer2Correct = NO;
    Answer1Correct = NO;
}

-(void)Question12{
    
    QuestionLabel1.text = @"The accepted principles of";
    QuestionLabel2.text = @"conduct that govern behavior are";
    Answer1Label.text = @"Laws";
    Answer2Label.text = @"Ethics";
    Answer3Label.text = @"Social Guidelines";
    Answer4Label.text = @"Protocols";
    Answer4Correct = NO;
    Answer3Correct = NO;
    Answer2Correct = YES;
    Answer1Correct = NO;
}



-(void)MoveBubbles1{
    
    Bubbles.position = CGPointMake(Bubbles.position.x, Bubbles.position.y + 1);
    
    if (Bubbles.position.y > 600){
        
        Bubbles.position = CGPointMake(Bubbles.position.x, -130);
    }
    
    
}

-(void)MoveBubbles2{
    
    
    Bubbles2.position = CGPointMake(Bubbles2.position.x, Bubbles2.position.y + 1);
    
    if (Bubbles2.position.y > 600){
        
        Bubbles2.position = CGPointMake(Bubbles2.position.x, -130);
    }
    
}


//Transition back to game

-(void)Transition{
    
    SKScene *Myscene = [[MyScene alloc] initWithSize: self.size];
    SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
    [self.view presentScene: Myscene transition:doors];
    
    
}

//Questions courtesy of TestBank102.com

//http://testbank102.com/212/free-test-bank-for-excellence-in-business-communication-10th-edition-by-thill/

@end
