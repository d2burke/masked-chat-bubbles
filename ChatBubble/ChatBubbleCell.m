//
//  ChatBubbleCell.m
//  ChatBubble
//
//  Created by Daniel.Burke on 4/18/14.
//  Copyright (c) 2014 D2. All rights reserved.
//

#import "ChatBubbleCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ChatBubbleCell{
    CGFloat bubbleGutter;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _cellWidth = self.frame.size.width;
        _bubbleWidth = (_bubbleSide == bSideRight) ? 200 : _cellWidth - 200;
        _bubbleHeight = 120;
        bubbleGutter = 50;
        
        //Add container to cell
        _bubbleContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _cellWidth, _bubbleHeight)];
        _bubbleContainer.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_bubbleContainer];
        
        //Add user image
        _userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 15, 36, 36)];
        _userImageView.image = [UIImage imageNamed:@"user_placeholder"];
        _userImageView.backgroundColor = [UIColor lightGrayColor];
        _userImageView.layer.cornerRadius = 18;
        _userImageView.clipsToBounds = YES;
        [self addSubview:_userImageView];
        
        //Add user name
        
        //Add image to cell
        _chatImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _cellWidth, _bubbleHeight)];
        _chatImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_bubbleContainer addSubview:_chatImageView];
        
        //Add text to cell
        _textBubble = [[UITextView alloc] init];
        _textBubble.editable = NO;
        _textBubble.backgroundColor = [UIColor clearColor];
        _textBubble.layer.cornerRadius = 10.f;
        [_bubbleContainer addSubview:_textBubble];
        
        //Create a mask layer that covers everthing
        CALayer *maskLayer = [CALayer layer];
        maskLayer.frame = self.frame;
        [_bubbleContainer.layer addSublayer:maskLayer];
        //Add other mask layers that, combined, will shape
        //what the final mask will be
        //No need to add the actual view, as the layer is all we need
        _bubbleTriangle = [[Triangle alloc] init];
        _bubbleTriangle.direction = tDirectionLeft;
        //No need to add the actual view, as the layer is all we need
        _bubbleView = [[UITextView alloc] init];
        _bubbleView.layer.cornerRadius = 10.f;
        [maskLayer addSublayer:_bubbleTriangle.layer];
        [maskLayer addSublayer:_bubbleView.layer];
        _bubbleContainer.layer.mask = maskLayer;
        _bubbleContainer.layer.masksToBounds = YES;
        
        
        
        
    }
    return self;
}

-(void)layoutSubviews{
    _bubbleHeight -= 10;
    _bubbleWidth = (_bubbleWidth > 310) ? 310 : _bubbleWidth;
    _bubbleWidth = (_bubbleSide == bSideRight) ? _bubbleWidth : _cellWidth - _bubbleWidth;
    
    _textBubble.frame = CGRectMake(bubbleGutter, 10, _bubbleWidth - 5, _bubbleHeight);
    
    //Add other mask layers that, combined, will shape
    //what the final mask will be
    _bubbleTriangle.frame = CGRectMake(bubbleGutter - 5, 23, 10, 20);
    _bubbleView.frame = CGRectMake(bubbleGutter, 10, _bubbleWidth - 5, _bubbleHeight);
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)isWallPixel:(UIImage*)image x:(int)x y:(int)y {
    
    CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage));
    const UInt8* data = CFDataGetBytePtr(pixelData);
    
    int pixelInfo = ((image.size.width  * y) + x ) * 4; // The image is png
    
    //UInt8 red = data[pixelInfo];         // If you need this info, enable it
    //UInt8 green = data[(pixelInfo + 1)]; // If you need this info, enable it
    //UInt8 blue = data[pixelInfo + 2];    // If you need this info, enable it
    UInt8 alpha = data[pixelInfo + 3];     // I need only this info for my maze game
    CFRelease(pixelData);
    
    //UIColor* color = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha/255.0f]; // The pixel color info
    
    if (alpha) return YES;
    else return NO;
    
}

@end
