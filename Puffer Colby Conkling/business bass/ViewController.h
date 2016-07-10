//
//  ViewController.h
//  Business Bass
//

//  Copyright (c) 2014 Colby Conkling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <iAd/iAd.h>


@interface ViewController : UIViewController <ADBannerViewDelegate> {
    
    ADBannerView *AdView;
    

}

@property (nonatomic, retain) IBOutlet ADBannerView *AdView;

@end
