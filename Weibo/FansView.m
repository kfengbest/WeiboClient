//
//  FansView.m
//  Weibo
//
//  Created by fengka on 9/10/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import "FansView.h"
#import <QuartzCore/QuartzCore.h>

@implementation FansView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        int wd = 160;
        int ht = 200;
        for (int i = 0; i < 3; i ++) {
            for (int j = 0; j < 3; j++) {
                
                // 320x400
                UIView* imageView = [[UIView alloc] initWithFrame:CGRectMake( wd*i + 2, ht*j + 5, wd, ht)];
                imageView.layer.contents = (id)[UIImage imageNamed:@"fans_card@simple@2x.png"].CGImage;
                [self addSubview:imageView];
                
            }
        }
        

        
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

@end
