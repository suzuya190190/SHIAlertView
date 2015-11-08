//
//  SHILable.h
//  SHIAlertView
//
//  Created by tomyKeisuke on 2015/11/01.
//  Copyright (c) 2015年 tomyKeisuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHILable : UILabel

-(instancetype)initWithFrameTitle:(CGRect)frame;
-(instancetype)initWithFrameDescreption:(CGRect)frame;

@property(nonatomic,retain)UILabel* titleLabel;
@property(nonatomic,retain)UILabel* descreptionLabel;

@end
