//
//  ViewController.m
//  Weibo
//
//  Created by fengka on 9/9/12.
//  Copyright (c) 2012 fengka. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "HomeView.h"
#import "AtView.h"
#import "CommentView.h"
#import "MessageView.h"
#import "InfoView.h"
#import "TopicView.h"
#import "DetailedView.h"

@interface ViewController ()
{
    UIScrollView*   mScrollView;
    HomeView*       mHomeView;
    AtView*         mAtView;
    CommentView*    mCommentView;
    MessageView*    mMessageView;
    InfoView*       mInfoView;
    TopicView*      mTopicView;
    DetailedView*   mDetailedView;
    
    MenuItem*       mActiveMenu;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    mActiveMenu = nil;
    
    self.view.layer.contents = (id)[UIImage imageNamed:@"wallpaper_darkgrey.jpg"].CGImage;
    
    int menuHeight = 42;
    int menuWidth = 64;
    
    int menuHeadHeight = 50;
    UIView* menuHead = [[UIView alloc] initWithFrame:CGRectMake(6, 0, menuHeadHeight, menuHeadHeight)];
    menuHead.layer.contents = (id)[UIImage imageNamed:@"headDefault.png"].CGImage;
    [self.view addSubview:menuHead];
    
    NSMutableArray* menus = [NSMutableArray arrayWithObjects : @"home", @"@", @"comment", @"message", @"info", @"topic", nil ];
    
    for (int i = 0; i < menus.count; i++) {
        MenuItem* menuHome = [[MenuItem alloc] initWithFrame:CGRectMake(0, menuHeight * (i+1) + 15, menuWidth, menuHeight)];
        [menuHome initWithName:[menus objectAtIndex:i] ];
        [menuHome setParentController:self];
        menuHome.tag = i;
        [self.view addSubview:menuHome];
        if (mActiveMenu == nil) {
            mActiveMenu = menuHome;
            [mActiveMenu setState:eHighlight];
        }

    }
    
    int contentWidth = 450;
    int contentHeight = 768;
    mScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(menuWidth, 0, contentWidth, contentHeight)];
    mScrollView.contentSize = CGSizeMake(contentWidth, contentHeight*3);
    [self.view addSubview:mScrollView];
    
    mHomeView = [[HomeView alloc] initWithFrame:CGRectMake(0, 0, contentWidth, contentHeight)];
    [mHomeView setParentController:self];
    [mScrollView addSubview:mHomeView];
    
    mAtView = [[AtView alloc] initWithFrame:CGRectMake(0, 0, contentWidth, contentHeight)];
    [mScrollView addSubview:mAtView];
    
    mCommentView = [[CommentView alloc] initWithFrame:CGRectMake(0, 0, contentWidth, contentHeight)];
    [mScrollView addSubview:mCommentView];

    mMessageView = [[MessageView alloc] initWithFrame:CGRectMake(0, 0, contentWidth, contentHeight)];
    [mScrollView addSubview:mMessageView];
    
    mInfoView = [[InfoView alloc] initWithFrame:CGRectMake(0, 0, contentWidth, contentHeight)];
    [mScrollView addSubview:mInfoView];

    mTopicView = [[TopicView alloc] initWithFrame:CGRectMake(0, 0, contentWidth, contentHeight)];
    [mScrollView addSubview:mTopicView];
    
    [mScrollView bringSubviewToFront:mHomeView];
    
    
    NSMutableArray* centerApps = [NSMutableArray arrayWithObjects : @"guangchang_center_default@2x", @"app_pics.png", @"app_wallpaper.png", @"app_pics.png", nil ];

    for (int i = 0; i < centerApps.count; i++) {
        UIView* dashAdd3 = [[UIView alloc] initWithFrame:CGRectMake(600 + (74 + 15)*i, 20, 148, 148)];
        dashAdd3.layer.contents = (id)[UIImage imageNamed:[centerApps objectAtIndex:i]].CGImage;
        dashAdd3.transform = CGAffineTransformMakeScale(0.5, 0.5);
        [self.view addSubview:dashAdd3];
    }
    
    for (int i = 0; i < centerApps.count; i++) {
        UIView* dashAdd3 = [[UIView alloc] initWithFrame:CGRectMake(600 + (74 + 15)*i, 20 + 74 + 15, 148, 148)];
        dashAdd3.layer.contents = (id)[UIImage imageNamed:[centerApps objectAtIndex:centerApps.count - i -1]].CGImage;
        dashAdd3.transform = CGAffineTransformMakeScale(0.5, 0.5);
        [self.view addSubview:dashAdd3];
    }
    

    
    UIView* dashAdd = [[UIView alloc] initWithFrame:CGRectMake(600, 20 + (74  + 15) * 2, 148, 148)];
    dashAdd.layer.contents = (id)[UIImage imageNamed:@"guangchang_dashboard_add@2x.png"].CGImage;
    dashAdd.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [self.view addSubview:dashAdd];
    
    mDetailedView = [[DetailedView alloc] initWithFrame:CGRectMake(1024- 510, 0, 510, contentHeight)];
    [self.view addSubview:mDetailedView];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(void) onViewTouched : (UIView*)sender
{
 
    if([sender isDescendantOfView:mHomeView]){
        HomeView* pHomeView = nil;
        pHomeView = (HomeView*)sender;
        if (pHomeView!=nil) {
            
            [UIView beginAnimations:@"ShowDetail" context:nil];
            [UIView setAnimationDuration:0.5];
            mDetailedView.frame = CGRectMake(1024-510, 0, 510, 768);
            [UIView commitAnimations];
        }
    }
    else {
        MenuItem* pMenuItem = nil;
        pMenuItem = (MenuItem*)sender;
        
        if ( pMenuItem!= nil ) {
            if ([pMenuItem name] == [mActiveMenu name]) {
                return;
            }
            if ([pMenuItem name] == @"home") {
                [mScrollView bringSubviewToFront:mHomeView];
            }
            else if ([pMenuItem name] == @"@") {
                [mScrollView bringSubviewToFront:mAtView];
            }
            else if ([pMenuItem name] == @"comment") {
                [mScrollView bringSubviewToFront:mCommentView];
            }
            else if ([pMenuItem name] == @"message") {
                [mScrollView bringSubviewToFront:mMessageView];
            }
            else if ([pMenuItem name] == @"info") {
                [mScrollView bringSubviewToFront:mInfoView];
            }
            else if ([pMenuItem name] == @"topic") {
                [mScrollView bringSubviewToFront:mTopicView];
            }
            
            [mActiveMenu setState:eNormal];
            mActiveMenu = pMenuItem;
        }
    }


    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

@end
