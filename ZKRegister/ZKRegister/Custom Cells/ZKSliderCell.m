//
//  ZKSliderCell.m
//  ZKRegister
//
//  Created by Zeeshan Khan on 13/11/12.
//  Copyright (c) 2012 Zeeshan Khan. All rights reserved.
//

#import "ZKSliderCell.h"

@interface ZKSliderCell ()
@property (nonatomic, strong) NSMutableDictionary *dicProperties;
@property (nonatomic, weak) id <CallBackFromCustomCellDelegate> callBackDelegate;
@end

@implementation ZKSliderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initializeCustomCellPropertiesWithCellDictionary:(NSMutableDictionary*)dicCell andObject:(id)object {
    _dicProperties = dicCell;
    _callBackDelegate = object;
    _lblTitle.text = [dicCell objectForKey:@"Title"];
    [[self slider] setValue:[[dicCell objectForKey:@"Value"] floatValue]];
    [self valueChangeInSlider:[self slider]];
    [[self slider] addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld context:NULL];
}

- (void)dealloc {
    [[self slider] removeObserver:self forKeyPath:@"frame"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"frame"] && [object isEqual:[self slider]]) {
        // updating label position on orientation change
        int64_t delayInSeconds = 0.3;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self valueChangeInSlider:[self slider]];
        });
    }
}

- (IBAction)valueChangeInSlider:(UISlider *)sender {
    
    //[[self dicProperties] setObject:[NSNumber numberWithFloat:sender.value] forKey:@"Value"];
    
    [[self callBackDelegate] setCustomCellValue:[NSNumber numberWithFloat:sender.value] forKey:[[self dicProperties] objectForKey:@"Key"]];
    
    [[self sliderValueLabel] setText:[NSString stringWithFormat:@"%d", (int)sender.value]];
    self.sliderValueLabel.center = CGPointMake([self xPositionFromSliderValue:sender], self.sliderValueLabel.center.y);
}

- (float)xPositionFromSliderValue:(UISlider *)aSlider {
    
    float sliderRange = aSlider.frame.size.width - aSlider.currentThumbImage.size.width;
    float sliderOrigin = aSlider.frame.origin.x + (aSlider.currentThumbImage.size.width / 2.0);
    
    float x = aSlider.value - aSlider.minimumValue;
    float y = aSlider.maximumValue - aSlider.minimumValue;
    float z = (x / y) * sliderRange;
    float sliderValueToPixels = z + sliderOrigin;
    
    return sliderValueToPixels;
}

@end
