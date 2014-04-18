//
//  ChatBubbleCell.m
//  ChatBubble
//
//  Created by Daniel.Burke on 4/18/14.
//  Copyright (c) 2014 D2. All rights reserved.
//

#import "ChatBubbleCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ChatBubbleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //Add container to cell
        _bubbleContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 310, 100)];
        _bubbleContainer.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_bubbleContainer];
        
        //Add image to cell
        _chatImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
        _chatImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_bubbleContainer addSubview:_chatImageView];
        
        //Add text to cell
        _textBubble = [[UITextView alloc] initWithFrame:CGRectMake(20, 0, 290, 100)];
        _textBubble.backgroundColor = [UIColor clearColor];
        _textBubble.layer.cornerRadius = 10.f;
        [_bubbleContainer addSubview:_textBubble];
        
        //Create a mask layer that covers everthing
        CALayer *maskLayer = [CALayer layer];
        maskLayer.frame = self.frame;
        [_bubbleContainer.layer addSublayer:maskLayer];
        
        //Add other mask layers that, combined, will shape
        //what the final mask will be
        
        _bubbleTriangle = [[Triangle alloc] initWithFrame:CGRectMake(13, 15, 10, 20)];
        _bubbleTriangle.direction = tDirectionLeft;
        //No need to add the actual view, as the layer is all we need
        
        _bubbleView = [[UITextView alloc] initWithFrame:CGRectMake(20, 0, 290, 100)];
        _bubbleView.layer.cornerRadius = 10.f;
        //No need to add the actual view, as the layer is all we need
        
        [maskLayer addSublayer:_bubbleTriangle.layer];
        [maskLayer addSublayer:_bubbleView.layer];
        
        _bubbleContainer.layer.mask = maskLayer;
        _bubbleContainer.layer.masksToBounds = YES;
        
    }
    return self;
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

@end
