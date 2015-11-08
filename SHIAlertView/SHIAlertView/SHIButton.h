//
//  SHIButton.h
//  SHIAlertView
//
//  Created by tomyKeisuke on 2015/11/03.
//  Copyright (c) 2015年 tomyKeisuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHIButton : UIButton

@property(nonatomic,strong)NSString* buttonTitle;

+(SHIButton*)alertButton:(NSString*)title
               addTarget:(id)target
             setSelector:(SEL)selector;
SHIButton* setButton(SHIButton* but, NSInteger i);
@end
