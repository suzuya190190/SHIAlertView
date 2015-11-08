//
//  SHILable.m
//  SHIAlertView
//
//  Created by tomyKeisuke on 2015/11/01.
//  Copyright (c) 2015年 tomyKeisuke. All rights reserved.
//

#import "SHILable.h"

@implementation SHILable

/**
 *  title Label
 *
 *  @param frame
 *
 *  @return 
 */
-(instancetype)initWithFrameTitle:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.font = [UIFont systemFontOfSize:33];
        self.backgroundColor = [UIColor clearColor];
        self.textAlignment = NSTextAlignmentCenter;
        /**
         *  default color
         */
        self.textColor = [UIColor blackColor];
    }
    return self;
}

/**
 *  Descreption Label
 *
 *  @param frame
 *
 *  @return
 */
-(instancetype)initWithFrameDescreption:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.font = [UIFont systemFontOfSize:20];
        self.backgroundColor = [UIColor clearColor];
        self.textAlignment  = NSTextAlignmentCenter;
        /**
         *  default color
         */
        self.textColor = [UIColor blackColor];
    }
    return self;
}
@end
