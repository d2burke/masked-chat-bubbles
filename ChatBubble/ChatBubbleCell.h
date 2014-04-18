//
//  ChatBubbleCell.h
//  ChatBubble
//
//  Created by Daniel.Burke on 4/18/14.
//  Copyright (c) 2014 D2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Triangle.h"

@interface ChatBubbleCell : UITableViewCell

@property (copy,nonatomic) UIView *bubbleContainer;
@property (copy, nonatomic) UITextView *textBubble;
@property (copy, nonatomic) Triangle *bubbleTriangle;
@property (copy, nonatomic) UIView *bubbleView;
@property (copy, nonatomic) UIImageView *chatImageView;

@end
