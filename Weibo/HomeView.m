//
//  HomeView.m
//  Weibo
//
//  Created by fengka on 9/9/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import "HomeView.h"
#import <QuartzCore/QuartzCore.h>
#import "BlogItemView.h"
#import "ViewController.h"

@implementation HomeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];

        for (int j = 0; j < 3; j++) {
            
            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"BlogItemView"owner:self options:nil];
            BlogItemView * blog = (BlogItemView*)[nibView objectAtIndex:0];
            [blog setFrame:CGRectMake(0, 300*j, 500, 300)];
            [blog init];
            
//            BlogItemView* blog = [[BlogItemView alloc] initWithFrame:CGRectMake(0, 300*j, 500, 300)];
            
            [self addSubview:blog];
        }
    }
    return self;
}

-(void) setParentController : (UIViewController*)parentController
{
    mParentController = parentController;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    ViewController* vc = (ViewController*)mParentController;
    [vc onViewTouched:self];
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
