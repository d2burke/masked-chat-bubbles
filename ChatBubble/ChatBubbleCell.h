//
//  ChatBubbleCell.h
//  ChatBubble
//
//  Created by Daniel.Burke on 4/18/14.
//  Copyright (c) 2014 D2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Triangle.h"

typedef enum BubbleSide{
    bSideRight = (int)0,
    bSideLeft = (int)1
} BubbleSide;

@interface ChatBubbleCell : UITableViewCell

@property (copy,nonatomic) UIView *bubbleContainer;
@property (copy, nonatomic) UITextView *textBubble;
@property (copy, nonatomic) Triangle *bubbleTriangle;
@property (copy, nonatomic) UIView *bubbleView;
@property (copy, nonatomic) UIImageView *chatImageView;

@property (copy, nonatomic) UILabel *userNameLabel;
@property (copy, nonatomic) UIImageView *userImageView;
@property (nonatomic) CGFloat cellWidth;
@property (nonatomic) CGFloat bubbleWidth;
@property (nonatomic) CGFloat bubbleHeight;
@property (nonatomic) BOOL userSquareEdges;
@property (nonatomic) BubbleSide *bubbleSide;

@end
