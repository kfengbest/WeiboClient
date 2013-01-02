//
//  MenuItem.h
//  Weibo
//
//  Created by fengka on 9/9/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    eNormal = 0,
    eHighlight
} EMenuItemState;

@interface MenuItem : UIView
{
    NSString* mImageName;
    UIViewController* mParentController;
    EMenuItemState* mState;
}

-(void) initWithName : (NSString*)name;
-(void) setParentController : (UIViewController*)parentController;
-(NSString*) name;
-(void) setState : (EMenuItemState)state;
@end
