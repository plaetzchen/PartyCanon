//
//  Confetti.m
//  Confetti
//
//  Created by Brechler, Philip on 25.01.16.
//  Copyright © 2016 Philip Brechler. All rights reserved.
//

#import "PartyCanonView.h"

@import QuartzCore;
@interface PartyCanonView ()

@property (nonatomic, strong) CAEmitterLayer *emitter;

@end

@implementation PartyCanonView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    
    self.emitter = [CAEmitterLayer layer];
    self.emitter.emitterPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) );
    self.emitter.emitterSize = CGSizeMake(20, 20);
    self.emitter.emitterMode = kCAEmitterLayerAdditive;
    self.emitter.emitterShape = kCAEmitterLayerRectangle;
    [self.layer addSublayer:_emitter];
    
    
    _colorize = YES;
    
    //Add the cell to the emitter layer
    _emitter.emitterCells = @[[self createEmitterCell]];
    
    self.location = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame));
    self.target = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame));
    self.velocity = 300.0f;
    self.amount = 500.0f;

}

- (void)shoot {
    self.emitter.beginTime = CACurrentMediaTime();

        
        
    [self.emitter setValue:[NSNumber numberWithFloat:self.amount] forKeyPath:@"emitterCells.confetti.birthRate"];


    
    double delayInSeconds = 0.1; // One cloud will have been created by now, but not two
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        

        [self.emitter setValue:[NSNumber numberWithFloat:0] forKeyPath:@"emitterCells.confetti.birthRate"];
    });
}

# pragma mark - Setters

- (void)setLocation:(CGPoint)location {
    _location = location;
    [self.emitter setEmitterPosition:location];
}

- (void)setTarget:(CGPoint)target {
    _target = target;
    CGFloat targetRadians = [self pointPairToBearingRadians:_location secondPoint:_target];
    [self.emitter setValue:[NSNumber numberWithFloat:targetRadians] forKeyPath:@"emitterCells.confetti.emissionLongitude"];
}

- (void)setVelocity:(CGFloat)velocity {
    _velocity = velocity;
    [self.emitter setValue:[NSNumber numberWithFloat:velocity] forKeyPath:@"emitterCells.confetti.velocity"];
}

- (void)setParticleImage:(UIImage *)particleImage {
    if (![particleImage isEqual:_particleImage]) {
        _particleImage = particleImage;
        [self.emitter setEmitterCells:@[[self createEmitterCell]]];
    }
}

- (void)setColorize:(BOOL)colorize {
    if (colorize != _colorize) {
        _colorize = colorize;
        [self.emitter setEmitterCells:@[[self createEmitterCell]]];
    }
}

# pragma mark - Create Emitter

- (CAEmitterCell *)createEmitterCell {
    //Create a new emitter cell
    CAEmitterCell* emitterCell = [CAEmitterCell emitterCell];
    
    //Set the cell’s contents property to the texture you loaded
    if (!self.particleImage) {
        NSBundle* bundle = [NSBundle bundleForClass:self.class];
        NSString *imagePath = [bundle pathForResource:@"confetti" ofType:@"png"];
        UIImage* image = [UIImage imageWithContentsOfFile:imagePath];
        emitterCell.contents = (__bridge id)[image CGImage];
    } else {
        emitterCell.contents = (__bridge id)[self.particleImage CGImage];
    }
    
    //Name the cell “cell”
    emitterCell.name = @"confetti";
    
    //Parameters
    emitterCell.birthRate = 0;
    emitterCell.lifetime = 7;
    emitterCell.lifetimeRange = 2;
    
    if (_colorize) {
    //Set the cell’s color to randomly vary its components
        emitterCell.blueRange = 1.00;
        emitterCell.blueSpeed = 0;
        emitterCell.redRange = 1.00;
        emitterCell.redSpeed = 0;
        emitterCell.greenRange = 1.00;
        emitterCell.greenSpeed = 0;
    } else {
        emitterCell.blueRange = 0;
        emitterCell.blueSpeed = 0;
        emitterCell.redRange = 0;
        emitterCell.redSpeed = 0;
        emitterCell.greenRange = 0;
        emitterCell.greenSpeed = 0;
    }
    
    //velocity
    emitterCell.velocity = self.velocity;
    emitterCell.velocityRange = floorf(self.velocity/10);
    
    //Alpha
    emitterCell.alphaSpeed = 4.5;
    emitterCell.alphaRange = 0.5;
    
    //Scale
    emitterCell.scale = 0.5;//0.5
    emitterCell.scaleRange = 0.5;//0.5
    emitterCell.scaleSpeed = 0.1;
    
    emitterCell.spin = M_PI;
    emitterCell.spinRange = M_PI/2;
    
    //Range
    emitterCell.emissionLongitude = -M_PI / 2; //Up
    emitterCell.emissionRange = M_PI / 12;
    
    emitterCell.yAcceleration = 180;
    return emitterCell;
}

#pragma mark - Helpers

- (CGFloat) pointPairToBearingRadians:(CGPoint)startingPoint secondPoint:(CGPoint) endingPoint
{
    CGPoint originPoint = CGPointMake(endingPoint.x - startingPoint.x, endingPoint.y - startingPoint.y); // get origin point to origin by subtracting end from start
    float bearingRadians = atan2f(originPoint.y, originPoint.x); // get bearing in radians
    return bearingRadians;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {    
    return NO;
}

@end
