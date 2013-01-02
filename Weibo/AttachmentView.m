//
//  AttachmentView.m
//  Weibo
//
//  Created by fengka on 9/9/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import "AttachmentView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AttachmentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.layer.contents = (id)[UIImage imageNamed:@"InfoViewWeiBoBackground.png"].CGImage;
        
//        //240x154
//        UIView* imageView = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width - 150, frame.size.height - 88, 120, 77)];
//       // imageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
//        imageView.layer.contents = (id)[UIImage imageNamed:@"cell_pic_bg1@simple.png"].CGImage;
//        imageView.clipsToBounds = YES;
//        [self addSubview:imageView];
        
        
    }
    return self;
}

-(void) init
{
    self.layer.contents = (id)[UIImage imageNamed:@"InfoViewWeiBoBackground.png"].CGImage;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
