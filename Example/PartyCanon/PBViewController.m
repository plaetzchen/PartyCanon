//
//  PBViewController.m
//  PartyCanon
//
//  Created by Philip Brechler on 01/26/2016.
//  Copyright (c) 2016 Philip Brechler. All rights reserved.
//

#import "PBViewController.h"
#import "PartyCanonView.h"

@interface PBViewController ()

@property (nonatomic, strong) IBOutlet PartyCanonView *partyCanon;
@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    [self.partyCanon setLocation:[self.view convertPoint:CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame)) toView:self.partyCanon]];
    [self.partyCanon setTarget:CGPointMake(self.partyCanon.location.x, self.partyCanon.location.y-100)];
}

- (IBAction)buttonAction:(id)sender {
    [self.partyCanon shoot];
}

- (IBAction)amountSliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [self.partyCanon setAmount:slider.value];
}

- (IBAction)velocitySliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [self.partyCanon setVelocity:slider.value];
}

- (IBAction)customImageToggle:(id)sender {
    UISwitch *imageSwitch = (UISwitch *)sender;
    if (imageSwitch.on) {
        [self.partyCanon setColorize:NO];
        [self.partyCanon setParticleImage:[UIImage imageNamed:@"coin"]];
    } else {
        [self.partyCanon setColorize:YES];
        [self.partyCanon setParticleImage:nil];
    }
}

@end
