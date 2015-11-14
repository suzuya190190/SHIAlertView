//
//  SHIButton.m
//  SHIAlertView
//
//  Created by tomyKeisuke on 2015/11/03.
//  Copyright (c) 2015年 tomyKeisuke. All rights reserved.
//

#import "SHIButton.h"

@implementation SHIButton

+(SHIButton*)alertButton:(NSString*)title
               addTarget:(id)target
             setSelector:(SEL)selector{
    SHIButton* but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.titleLabel.font = [UIFont systemFontOfSize:35];
    but.backgroundColor = [UIColor clearColor];
    [but setTitle:@"tit" forState:UIControlStateNormal];

    return but;
    
}

SHIButton* setButton(SHIButton* but, NSInteger i){
    but.tag = i;
    but.layer.borderColor = [UIColor grayColor].CGColor;
    but.layer.borderWidth = 0.5f;
    return but;
}


@end
