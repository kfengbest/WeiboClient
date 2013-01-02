//
//  MenuItem.m
//  Weibo
//
//  Created by fengka on 9/9/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import "MenuItem.h"
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@implementation MenuItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(void) initWithName : (NSString*)name
{
    mImageName = name;
    
    [self setState : eNormal];

}

-(void) setParentController : (UIViewController*)parentController
{
    mParentController = parentController;
}

-(NSString*) name
{
    return mImageName;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setState : eHighlight];
    
    ViewController* vc = (ViewController*)mParentController;
    [vc onViewTouched:self];
}

-(void) setState : (EMenuItemState)state
{
    if (state == eNormal)
    {
        NSString* strNormal = [[NSString alloc] initWithString:[NSString stringWithFormat:@"menu_%@@simple.png",mImageName]];
        self.layer.contents = (id)[UIImage imageNamed:strNormal].CGImage;
 
    }
    else if (state == eHighlight)
    {
        NSString* strHL = [[NSString alloc] initWithString:[NSString stringWithFormat:@"menu_%@_hl@simple.png",mImageName]];
        self.layer.contents = (id)[UIImage imageNamed:strHL].CGImage;

    }
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
