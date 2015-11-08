//
//  SHIAlertView.h
//  SHIAlertView
//
//  Created by tomyKeisuke on 2015/10/31.
//  Copyright (c) 2015年 tomyKeisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHILable.h"


@class SHIAlertView;

@protocol SHIAlertViewDelegate <NSObject>

-(void)shiAlertView:(SHIAlertView*)alert ;
-(void)shiAlertView:(SHIAlertView*)alert clickButtonIndex:(NSInteger)index;
@end

@interface SHIAlertView : UIView

+(SHIAlertView*)sharedView;

-(void)alertShow;
@property(nonatomic,strong)UIView* baseView;

@property(nonatomic,retain)SHILable* title;
@property(nonatomic,retain)SHILable* message;
@property(nonatomic,retain)id<SHIAlertViewDelegate> deleate;

-(instancetype)initWithTitle:(NSString*)title
                 descreption:(NSString*)descreption delegate:(id)delegate cancelButton:(NSString*)buttonTitle otherButton:(NSString*)otherTitle;

-(instancetype)initWithTitle:(NSString *)title descreption:(NSString *)descreption delegate:(id)delegate buttonArry:(NSArray*)buttonTitle;

-(void)showTitle:(NSString*)title descreption:(NSString*)descreption buttonTitle:(NSString*)buttonTitle;

-(void)showTitleAnyButton:(NSString *)title descreption:(NSString *)descreption buttonTitle:(NSArray *)buttonArray;

-(void)showTitle:(NSString*)title descreption:(NSString*)descreption buttonTitle:(NSString*)buttonTitle otherTitle:(NSString*)otherButton;

-(void)gradiatorColor:(NSString*)start endColor:(NSString*)endcolor alpha:(float)alpha;

@end
