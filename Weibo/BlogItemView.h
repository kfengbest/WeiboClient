//
//  BlogItem.h
//  Weibo
//
//  Created by fengka on 9/9/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttachmentView.h"

@interface BlogItemView : UIView
{
    AttachmentView* mAttachmentView;
}

@property (nonatomic, strong) IBOutlet UIImageView *mUserHeadIcon;
@property (nonatomic, strong) IBOutlet UILabel *mUserNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *mBlogContentLabel;
@property (nonatomic, strong) IBOutlet UILabel *mTimeLabel;

-(void) init;

@end
