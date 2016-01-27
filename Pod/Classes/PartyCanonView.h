//
//  Confetti.h
//  Confetti
//
//  Created by Brechler, Philip on 25.01.16.
//  Copyright © 2016 Philip Brechler. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Add some party cannon to your view. Add this view as the top one to your viewcontroller, set the location and target and the let the cannon explode!.
 */
@interface PartyCanonView : UIView


/**
 The start point of the confetti
 */
@property (nonatomic) CGPoint location;

/**
 The direction we should shoot we should shoot. Default is to shoot just straight up
 */
@property (nonatomic) CGPoint target;


/**
 The velocity we shoot with. Default is 350.
 */
@property (nonatomic) CGFloat velocity;

/**
 The amount of confetti we shoot. Default is 
 */
@property (nonatomic) CGFloat amount;

/**
 The image to use as the particle. Could be your company logo
 */
@property (nonatomic, strong) UIImage *particleImage;

/**
 Wehter the particles should be colorized. Set to NO if you want to use the particles native color instead of colorful particles.
 */
@property (nonatomic) BOOL colorize;

/**
 Fire the canon!
 */
- (void)shoot;

@end
