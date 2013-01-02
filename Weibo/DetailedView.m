//
//  DetailedView.m
//  Weibo
//
//  Created by fengka on 9/10/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import "DetailedView.h"

@implementation DetailedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView beginAnimations:@"hide" context:nil];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(1024, 0, 0, 768);
    [UIView commitAnimations];
}

@end
