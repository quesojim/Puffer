//
//  MyScene.m
//  Business Bass
//
//  Created by Colby Conkling on 2/28/14.
//  Copyright (c) 2014 Colby Conkling. All rights reserved.
//

#import "MyScene.h"
#import "ViewController.h"
#import <Social/Social.h>
#import <UIKit/UIKit.h>
#import "QuestionScene.h"


@interface MyScene () <SKPhysicsContactDelegate> {
    
    //Declaring variables
    
    BOOL CanRestart;
    BOOL CheckForTouchEvents;
    BOOL CanMove;
    BOOL NewHighScore;
    int  impulse;
    SKSpriteNode* Fish;
    SKSpriteNode *Background;
    SKSpriteNode *Bubbles;
    SKSpriteNode *Bubbles2;
    SKSpriteNode *Seaweed1;
    SKSpriteNode *Seaweed2;
    SKSpriteNode *PrestigeStar;
    SKColor* BackgroundColor;
    SKTexture* ObstacleTexture1;
    SKTexture* ObstacleTexture2;
    SKAction* MoveObstaclesAndRemove;
    SKNode* Moving;
    SKNode* Obstacles;
    SKLabelNode  *ScoreLabelNode;
    SKLabelNode  *HighScoreLabelNode;
    SKLabelNode  *ScoreLabelNodeForMenu;
    SKLabelNode  *HighScoreLabelNodeForMenu;
    SKLabelNode  *HighScoreNode;
    SKLabelNode  *PrestigeLabel;
    SKLabelNode  *DeveloperLabel;
    NSInteger Score;
    NSInteger HighScore;
    NSInteger score;
    NSInteger PrestigeLevel;
    SKSpriteNode *GameOver;
    SKSpriteNode *ShareButton;
    SKSpriteNode *PlayAgainButton;
    SKSpriteNode *TapHand;
    NSTimer *PopOutScoreTimer;
    NSTimer *PopOutHighScoreTimer;
    NSTimer *MoveBubblesTimer;
    NSTimer *MoveBubblesTimer2;
    NSTimer *MoveSeaweedTimer1;
    NSTimer *MoveSeaweedTimer2;
    NSString *Image1;
    NSString *Image2;
    SKTexture *FishTexture1;
    SKTexture *FishTexture2;
    
    
}
@end


@implementation MyScene



//Declaring constants

static const uint32_t FishCategory = 1 << 0;
static const uint32_t WorldCategory = 1 << 1;
static const uint32_t ObstacleCategory = 1 << 2;
static const uint32_t scoreCategory = 1 << 3;
static NSInteger const ObstacleGap = 179;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        [self SetScene];
        
        TapHand = [SKSpriteNode spriteNodeWithImageNamed: @"TapHand"];
        
        TapHand.position = CGPointMake(CGRectGetMidX(self.frame) - 45, CGRectGetMidY(self.frame) - 35);
        
        TapHand.size = CGSizeMake(50, 65);
        
        [self addChild:TapHand];
        
        
    }
    
    return self;
}




        /* Setup your scene here */

        
    -(void)SetScene{
        
        PrestigeLevel = 1;
        
        [PopOutHighScoreTimer invalidate];
        
        CanMove = NO;
        
        impulse = 28;
        
        CheckForTouchEvents = NO;
        
        NewHighScore = NO;
        
        Background = [SKSpriteNode spriteNodeWithImageNamed:@"BlueBackground"];
        
        Background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        Background.zPosition = -10.0;
        
        Background.size = CGSizeMake(320, 600);
        
        Background.hidden = NO;
        
        Moving.speed = 0;
        
        [self addChild: Background];
        
        Bubbles = [SKSpriteNode spriteNodeWithImageNamed:@"Bubbles"];
        
        Bubbles.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        Bubbles.zPosition = - 9.0;
        
        Bubbles.size = CGSizeMake(320, 480);
        
        [self addChild:Bubbles];
        
        PrestigeStar = [SKSpriteNode spriteNodeWithImageNamed:@"Star"];
        
        PrestigeStar.position = CGPointMake (CGRectGetMidX(self.frame) + 80, CGRectGetMidY(self.frame) + 13);
        
        PrestigeStar.zPosition = 100;
        
        PrestigeStar.zPosition = 250;
        
        PrestigeStar.size = CGSizeMake(60, 60);

        [self addChild:PrestigeStar];
        
        PrestigeStar.hidden = YES;
        
        PrestigeLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
        
        PrestigeLabel.position = CGPointMake(CGRectGetMidX(self.frame) + 80, CGRectGetMidY(self.frame) + 3);
        
        PrestigeLabel.zPosition = 100;
        
        PrestigeLabel.text = @"-";
        
        PrestigeLabel.fontSize = (20);
        
        PrestigeLabel.fontColor = [SKColor blackColor];
        
        PrestigeLabel.text = [NSString stringWithFormat:@"%ld", (long)PrestigeLevel];
        
        PrestigeLabel.zPosition = 300;
        
        [self addChild:PrestigeLabel];
        
        PrestigeLabel.hidden = YES;
        
        MoveBubblesTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(MoveBubbles1) userInfo:nil repeats:YES];
        
        Bubbles2 = [SKSpriteNode spriteNodeWithImageNamed:@"Bubbles"];
        
        Bubbles2.position = CGPointMake(CGRectGetMidX(self.frame), 0);
        
        Bubbles2.zPosition = - 9.0;
        
        Bubbles2.size = CGSizeMake(320, 480);
        
        [self addChild:Bubbles2];
        
        MoveBubblesTimer2 = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(MoveBubbles2) userInfo:nil repeats:YES];
        
        Seaweed1 = [SKSpriteNode spriteNodeWithImageNamed:@"Seaweed"];
        
        Seaweed1.position = CGPointMake(130, 140);
        
        Seaweed1.zPosition = -8.5;
    
        Seaweed1.size = CGSizeMake(425, 131);

        [self addChild:Seaweed1];
        
        MoveSeaweedTimer1 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(MoveSeaweed1) userInfo:nil repeats:YES];
        
        Seaweed2 = [SKSpriteNode spriteNodeWithImageNamed:@"Seaweed"];
        
        Seaweed2.position = CGPointMake(545, 140);
        
        Seaweed2.zPosition = -8.5;
        
        Seaweed2.size = CGSizeMake(425, 131);
        
        [self addChild:Seaweed2];
        
        MoveSeaweedTimer2 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(MoveSeaweed2) userInfo:nil repeats:YES];

        //Creating gameover pop up box
        
        GameOver = [SKSpriteNode spriteNodeWithImageNamed:@"GameOverMenu"];
        
        GameOver.position = CGPointMake (CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        [self addChild:GameOver];
        
        GameOver.size = CGSizeMake(300, 200);
        
        GameOver.hidden = YES;
        
        GameOver.zPosition = 200;
        
        
        //Creating facebook share button on GameOver box
        
        ShareButton = [SKSpriteNode spriteNodeWithImageNamed:@"RateButton"];
        
        ShareButton.position = CGPointMake(90, CGRectGetMidY(self.frame) - 55);
        
        [self addChild: ShareButton];
        
        ShareButton.size = CGSizeMake(100, 41);
        
        ShareButton.hidden = YES;
        
        ShareButton.zPosition = 500;
        
        
        //Creating playagian button on GameOver box
        
        PlayAgainButton = [SKSpriteNode spriteNodeWithImageNamed:@"PlayAgainButton"];
        
        PlayAgainButton.name = @"PlayAgainButton";
        
        PlayAgainButton.position = CGPointMake(230, CGRectGetMidY(self.frame) - 55);
        
        [self addChild: PlayAgainButton];
        
        PlayAgainButton.size = CGSizeMake(100, 43);
        
        PlayAgainButton.hidden = YES;
        
        PlayAgainButton.zPosition = 500;
        
        //Creating score for game Over menu
        
        

        
        //Retrieving saved High Score
        
        NSUserDefaults *fetchDefaults = [NSUserDefaults standardUserDefaults];
        
        NSInteger HighScoreStored = [fetchDefaults integerForKey:@"HighScore"];
        
        NSInteger PrestigeLevelStored = [fetchDefaults integerForKey:@"PrestigeLevelStored"];
        
        PrestigeLevel = PrestigeLevelStored;
        
        score = HighScoreStored;
        
        
        //Fish still alive
        
        CanRestart = NO;
        
        
        //Setting gravity of world
        
        self.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
        
        self.physicsWorld.contactDelegate = self;
        
        
        //Setting background color
        
        BackgroundColor = [SKColor blackColor];
        
        [self setBackgroundColor:BackgroundColor];
        
        
        //Creating motion node
        
        Moving = [SKNode node];
        
        Moving.speed = 2;
        
        [self addChild: Moving];
        
        
        //Adding obstacles to motion node
        
        Obstacles = [SKNode node];
        
        [Moving addChild: Obstacles];
        
        
        //Animating fish
        
        FishTexture1 = [SKTexture textureWithImageNamed:@"Deflated1Small"];
        
        FishTexture2 = [SKTexture textureWithImageNamed:@"Inflated1Small"];
        
        Fish = [SKSpriteNode spriteNodeWithTexture:FishTexture1];
        
        Fish.position = CGPointMake(self.frame.size.width / 4, CGRectGetMidY(self.frame));
        
        Fish.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:Fish.size.height / 2];
        
        Fish.physicsBody.dynamic = YES;
        
        Fish.physicsBody.allowsRotation = NO;
        
        Fish.physicsBody.categoryBitMask = FishCategory;
        
        Fish.physicsBody.collisionBitMask = WorldCategory | ObstacleCategory;
        
        Fish.physicsBody.contactTestBitMask = WorldCategory | ObstacleCategory;
        
        Fish.size = CGSizeMake (100, 52);
        
        [self addChild:Fish];
        
        
        
        //Creating the moving ground
        
        SKTexture* groundTexture = [SKTexture textureWithImageNamed:@"dirt"];
        
        SKAction* moveGroundSprite = [SKAction moveByX:-groundTexture.size.width*2 y:0 duration:0.02 * groundTexture.size.width*2];
        
        SKAction* resetGroundSprite = [SKAction moveByX:groundTexture.size.width*2 y:0 duration:0];
        
        SKAction* moveGroundSpritesForever = [SKAction repeatActionForever:[SKAction sequence:@[moveGroundSprite, resetGroundSprite]]];
        
        for(int i = 0; i < 2 + self.frame.size.width / ( groundTexture.size.width * 2); ++i ) {
            
        SKSpriteNode* sprite = [SKSpriteNode spriteNodeWithTexture:groundTexture];
            
            
        [sprite setScale: 2.0];
            
        sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2);
            
        [sprite runAction:moveGroundSpritesForever];
            
            sprite.zPosition = 500;
            
        [Moving addChild:sprite];

            

        }
        
        
        // Creating holder for ground physics
        
        SKNode* dummy = [SKNode node];
        
        dummy.position = CGPointMake(0, groundTexture.size.height);
        
        dummy.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.frame.size.width, groundTexture.size.height * 2)];
        
        dummy.physicsBody.dynamic = NO;
        
        dummy.physicsBody.categoryBitMask = WorldCategory;
        
        [self addChild:dummy];
        
        
       
        
        // Creating Obstacles
        
        ObstacleTexture1 = [SKTexture textureWithImageNamed:@"LogBig"];
        
        ObstacleTexture2 = [SKTexture textureWithImageNamed:@"Hook"];
        
        CGFloat distanceToMove = self.frame.size.width + 2 * ObstacleTexture1.size.width;
        
        SKAction* MoveObstacles = [SKAction moveByX:-distanceToMove y:0 duration:0.01 * distanceToMove];
        
        SKAction* RemoveObstacles = [SKAction removeFromParent];
        
        MoveObstaclesAndRemove = [SKAction sequence:@[MoveObstacles, RemoveObstacles]];
        
        SKAction* create = [SKAction performSelector:@selector(CreateObstacles) onTarget:self];
        
        SKAction* delay = [SKAction waitForDuration:2.0];
        
        SKAction* spawnThenDelay = [SKAction sequence:@[create, delay]];
        
        SKAction* spawnThenDelayForever = [SKAction repeatActionForever:spawnThenDelay];
        
        [self runAction:spawnThenDelayForever];
        
        
        
        
        
        //Making the label to hold current score
        
        Score = 0;
        
        ScoreLabelNode = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
        
        ScoreLabelNode.position = CGPointMake( CGRectGetMidX( self.frame ), 3 * self.frame.size.height / 4 );
        
        ScoreLabelNode.zPosition = 100;
        
        ScoreLabelNode.text = [NSString stringWithFormat:@"%ld", (long)Score];
        
        ScoreLabelNodeForMenu = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
        
        ScoreLabelNodeForMenu.position = CGPointMake(140, CGRectGetMidY(self.frame) + 16.5);
        
        ScoreLabelNodeForMenu.zPosition = 500;
        
        ScoreLabelNodeForMenu.text = @"-";
        
        ScoreLabelNodeForMenu.fontSize = (20);
        
        ScoreLabelNodeForMenu.fontColor = [SKColor blackColor];
        
        ScoreLabelNodeForMenu.text = [NSString stringWithFormat:@"%ld", (long)Score];
        
        ScoreLabelNodeForMenu.hidden = YES;
        
        HighScoreLabelNodeForMenu = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
        
        HighScoreLabelNodeForMenu.fontSize = (20);
        
        HighScoreLabelNodeForMenu.fontColor = [SKColor blackColor];
        
        HighScoreLabelNodeForMenu.position = CGPointMake(140, CGRectGetMidY(self.frame) - 12);
        
        HighScoreLabelNodeForMenu.text = @"-";
        
        HighScoreLabelNodeForMenu.zPosition = 500;
        
        HighScoreLabelNodeForMenu.hidden = YES;
        
        
        
        //Adding label to scene
        
        [self addChild:ScoreLabelNode];
        [self addChild:ScoreLabelNodeForMenu];
        [self addChild:HighScoreLabelNodeForMenu];
        
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
    
    if(Fish.position.y > 600){
        
        [self GameOver];
    }
}

-(void)MoveSeaweed1{
    
    Seaweed1.position = CGPointMake(Seaweed1.position.x - 1, Seaweed1.position.y);
    
    if (Seaweed1. position.x < - 200){
        
        Seaweed1.position = CGPointMake(545, Seaweed1.position.y);
    }
    
    
}

-(void)MoveSeaweed2{
    
    Seaweed2.position = CGPointMake(Seaweed2.position.x - 1, Seaweed2.position.y);
    
    if (Seaweed2.position.x < - 200){
        
        Seaweed2.position = CGPointMake(545, Seaweed2.position.y);
    }

    
    
}

//Creating the randomly placed objects with a constant space between them

-(void)CreateObstacles {
    
    if (CanMove == YES){
        
    SKNode* ObstaclePair = [SKNode node];
    
    ObstaclePair.position = CGPointMake( self.frame.size.width + ObstacleTexture1.size.width, 0 );
    
    ObstaclePair.zPosition = -5.0;
    
    CGFloat y = arc4random() % (NSInteger)( self.frame.size.height / 3 );
    
    SKSpriteNode* Obstacle1 = [SKSpriteNode spriteNodeWithTexture: ObstacleTexture1];
    
    Obstacle1.size = CGSizeMake(45, 255);
    
    Obstacle1.position = CGPointMake( 0, y );
    
    Obstacle1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:Obstacle1.size];
    
    Obstacle1.physicsBody.dynamic = NO;
    
    Obstacle1.physicsBody.categoryBitMask = ObstacleCategory;
    
    Obstacle1.physicsBody.contactTestBitMask = FishCategory;
    
    [ObstaclePair addChild:Obstacle1];
    
    SKSpriteNode* Obstacle2 = [SKSpriteNode spriteNodeWithTexture: ObstacleTexture2];
    
    Obstacle2.size = CGSizeMake(40, 398);
    
    Obstacle2.position = CGPointMake( 0, y + Obstacle1.size.height + ObstacleGap );
    
    Obstacle2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:Obstacle2.size];
    
    Obstacle2.physicsBody.dynamic = NO;
    
    Obstacle2.physicsBody.categoryBitMask = ObstacleCategory;
    
    Obstacle2.physicsBody.contactTestBitMask = FishCategory;
    
    [ObstaclePair addChild:Obstacle2];
    
    SKNode* contactNode = [SKNode node];
    
    contactNode.position = CGPointMake( Obstacle1.size.width + Fish.size.width / 2, CGRectGetMidY( self.frame ) );
    
    contactNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(Obstacle2.size.width, self.frame.size.height)];
    
    contactNode.physicsBody.dynamic = NO;
    
    contactNode.physicsBody.categoryBitMask = scoreCategory;
    
    contactNode.physicsBody.contactTestBitMask = FishCategory;
    
    [ObstaclePair addChild:contactNode];
    
    [ObstaclePair runAction: MoveObstaclesAndRemove];
    
    [Obstacles addChild: ObstaclePair];
        
    }
}




//Move to question scene so player can continue

/* -(void)TransitionScene{
    
    [self removeAllChildren];
    [self removeAllActions];
    [self SetScene];
    
    
}
 
 */

-(void)TransitionScene{
    
    SKScene *Questionscene = [[QuestionScene alloc] initWithSize: self.size];
    SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
    [self.view presentScene:Questionscene transition:doors];
    
}


//Share to Facebook method

-(void)ShareToFacebook{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/puffer/id838319974?ls=1&mt=8"]];
    
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Feature Not Yet Available" message:@"A leaderboard will be included in a future update." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Got it!",nil];
    [alert show];
*/
}


//Handling Touch Events for Game

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CanMove = YES;
    
    TapHand.hidden = YES;
    
    if (CheckForTouchEvents == YES){
        
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        
        
        if (point.x > 160){
            
            [self TransitionScene];
        }
        
        if (point.x < 160){
            
            [self ShareToFacebook];
        }
        
    }
    

    if ((Score > -1 && Score < 5) || (Score > 9 && Score < 15) || (Score > 19 && Score < 25) || (Score > 29 && Score < 35) || (Score > 39 && Score < 45)|| (Score > 49 && Score < 55)|| (Score > 59 && Score < 65)|| (Score > 69 && Score < 75)|| (Score > 89 && Score < 95) || (Score > 99 && Score < 105) || (Score > 109 && Score < 115)|| (Score > 119 && Score < 125)|| (Score > 129 && Score < 135)|| (Score > 139 && Score < 145)|| (Score > 149 && Score < 155)|| (Score > 159 && Score < 165)|| (Score > 169 && Score < 175)|| (Score > 179 && Score < 185)|| (Score > 189 && Score < 195)|| (Score > 199 && Score < 205)|| (Score > 209 && Score < 215)|| (Score > 219 && Score < 225)|| (Score > 229 && Score < 235)|| (Score > 239 && Score < 245)|| (Score > 249 && Score < 255)) {
    
    self.physicsWorld.gravity = CGVectorMake(0.0, -5.0);
    
    if( Moving.speed > 0 ) {
        
        Fish.physicsBody.velocity = CGVectorMake(0, 0);
        
        [Fish.physicsBody applyImpulse:CGVectorMake(0, 28)];
        
        [self runAction:[SKAction playSoundFileNamed:@"fishmoving.wav" waitForCompletion:YES]];
        
        Fish.texture = FishTexture1;
        Fish.size = CGSizeMake(100, 52);
        
    }
        
    }
    
    if ((Score > 4 && Score < 10) || (Score > 14 && Score < 20) || (Score > 24 && Score < 30) || (Score > 34 && Score < 40) || (Score > 44 && Score < 50)|| (Score > 54 && Score < 60)|| (Score > 64 && Score < 70)|| (Score > 74 && Score < 80)|| (Score > 94 && Score < 100) || (Score > 104 && Score < 110) || (Score > 114 && Score < 120)|| (Score > 124 && Score < 130)|| (Score > 134 && Score < 140)|| (Score > 144 && Score < 150)|| (Score > 154 && Score < 160)|| (Score > 164 && Score < 170)|| (Score > 174 && Score < 180)|| (Score > 184 && Score < 190)|| (Score > 194 && Score < 200)|| (Score > 204 && Score < 210)|| (Score > 214 && Score < 220)|| (Score > 224 && Score < 230)|| (Score > 234 && Score < 240)|| (Score > 244 && Score < 250)) {
        
        self.physicsWorld.gravity = CGVectorMake(0.0, 5.0);
        
        if( Moving.speed > 0 ) {
            
            Fish.physicsBody.velocity = CGVectorMake(0, 0);
            
            [Fish.physicsBody applyImpulse:CGVectorMake(0, -28)];
            
            [self runAction:[SKAction playSoundFileNamed:@"fishmoving.wav" waitForCompletion:YES]];
            
            Fish.texture = FishTexture2;
            Fish.size = CGSizeMake(75, 62);
            
        }

}
    
    
    
    else if(CanRestart) {
        
    [self GameOver];
    
    }
}



//Called when Fish hits ground or obstacle

-(void)GameOver{
    
    [MoveBubblesTimer invalidate];
    [MoveBubblesTimer2 invalidate];
    [MoveSeaweedTimer1 invalidate];
    [MoveSeaweedTimer2 invalidate];
    
    GameOver.hidden = NO;
    Background.hidden = NO;
    HighScoreLabelNodeForMenu.hidden = NO;
    ScoreLabelNode.hidden = YES;
    ShareButton.hidden = NO;
    PlayAgainButton.hidden = NO;
    CheckForTouchEvents = YES;
    ScoreLabelNodeForMenu.hidden = NO;
    CanMove = NO;
    PopOutScoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(PopOutScoreLabel) userInfo:nil repeats:NO];
    
    if (Score > score){
        
        score = Score;
        NewHighScore = YES;
    
    }
    
    if (NewHighScore == YES) {
        
        HighScoreLabelNodeForMenu.fontColor = [SKColor redColor];
        
        [self runAction:[SKAction playSoundFileNamed:@"NewHighScore.wav" waitForCompletion:NO]];
        
        PopOutHighScoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(PopOutHighScoreLabel) userInfo:nil repeats:YES];
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithLong:score] forKey:@"HIGHSCORE"];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setInteger: score forKey:@"HighScore"];
        
        //Storing High Score value
        
        [defaults synchronize];

        
    }
    
}


-(void)PopOutHighScoreLabel{
    
   [HighScoreLabelNodeForMenu runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:1.0 duration:0.5]]]];
    NewHighScore = NO;
    
}

-(void)PopOutScoreLabel {
    
    [ScoreLabelNodeForMenu runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:1.0 duration:0.5]]]];
    
    ScoreLabelNodeForMenu.text = [NSString stringWithFormat:@"%ld", (long)Score];
    HighScoreLabelNodeForMenu.text = [NSString stringWithFormat:@"%ld", (long)score];
}
        


CGFloat clamp(CGFloat min, CGFloat max, CGFloat value) {
    if( value > max ) {
        return max;
    } else if( value < min ) {
        return min;
    } else {
        return value;
    }
}



-(void)update:(CFTimeInterval)currentTime {
    
    /* Called before each frame is rendered */
    if(Moving.speed > 0 ) {
        
        Fish.zRotation = clamp( -1, 0.5, Fish.physicsBody.velocity.dy * ( Fish.physicsBody.velocity.dy < 0 ? 0.003 : 0.001 ) );
    
    
    }
}



//Fish has collided with ground, obstacle, or score object

- (void)didBeginContact:(SKPhysicsContact *)contact {
    if( Moving.speed > 0 ) {
       
        //Fish has contact with score object
        
        if( ( contact.bodyA.categoryBitMask & scoreCategory ) == scoreCategory || ( contact.bodyB.categoryBitMask & scoreCategory ) == scoreCategory ) {
            
            
            Score++;
            
            [self runAction:[SKAction playSoundFileNamed:@"ThroughObstacle.wav" waitForCompletion:NO]];
            
            ScoreLabelNode.text = [NSString stringWithFormat:@"%ld", (long)Score];
            
            // Make score pop out and return
            
            [ScoreLabelNode runAction:[SKAction sequence:@[[SKAction scaleTo:1.5 duration:0.1], [SKAction scaleTo:1.0 duration:0.1]]]];
            
            }
        
        
        else {
            
            // Fish has collided with ground or obstacle
            
    
            Moving.speed = 0;
            
            Background.hidden = YES;
            
            Fish.physicsBody.collisionBitMask = WorldCategory;
            
            [Fish runAction:[SKAction rotateByAngle:M_PI * Fish.position.y * 0.02 duration:Fish.position.y * 0.0025] completion:^{
                Fish.speed = 0;
            }];
            
            
            // Flash background red if fish collides wiht ground or obstacle
            
            [self removeActionForKey:@"flash"];
            
            [self runAction:[SKAction playSoundFileNamed:@"FishDied.mp3" waitForCompletion:YES]];
            
            
            
            [self runAction:[SKAction sequence:@[[SKAction repeatAction:[SKAction sequence:@[[SKAction runBlock:^
            {
            
                
            self.backgroundColor = [SKColor redColor];}],
            
            [SKAction waitForDuration:0.05], [SKAction runBlock:^{self.backgroundColor = BackgroundColor;}],
            
            [SKAction waitForDuration:0.05]]] count:3], [SKAction runBlock:^{
            
            CanRestart = YES;
                
            [self GameOver];
            
            }]]] withKey:@"flash"];
        }
        
        
        
    }
    
  
   
}

@end

