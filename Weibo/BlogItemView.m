//
//  BlogItem.m
//  Weibo
//
//  Created by fengka on 9/9/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import "BlogItemView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BlogItemView
@synthesize mUserHeadIcon;
@synthesize mUserNameLabel;
@synthesize mBlogContentLabel;
@synthesize mTimeLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
   
        
        
 //       mUserHeadIcon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
 //       mUserHeadIcon.image = [UIImage imageNamed:@"headDefault.png"];
 //       [self addSubview:mUserHeadIcon];
//
//        mUserNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5+50+5, 5, frame.size.width, 20)];
//        [self addSubview:mUserNameLabel];
//        mUserNameLabel.text = @"Kaven Feng";
//        
//        mBlogContentLabel = [[UILabel alloc] initWithFrame: CGRectMake(5+50+5, 5+20, frame.size.width, 100)];
//        [self addSubview:mBlogContentLabel];
//        mBlogContentLabel.text = @"早起的鸟儿发微薄呀";
        
//        mAttachmentView = [[AttachmentView alloc] initWithFrame:CGRectMake(0, mBlogContentLabel.frame.origin.y + mBlogContentLabel.frame.size.height + 5, frame.size.width, 180)];
//        [self addSubview:mAttachmentView];
        
        


        
    }
    return self;
}

-(void) init{
    
    CGRect frame = self.frame;
    
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"AttachmentView"owner:self options:nil];
    mAttachmentView = (AttachmentView*)[nibView objectAtIndex:0];
    [mAttachmentView setFrame:CGRectMake(0, mBlogContentLabel.frame.origin.y + mBlogContentLabel.frame.size.height + 5, frame.size.width, 180)];
    [mAttachmentView init];
    [self addSubview:mAttachmentView];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor redColor];
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
