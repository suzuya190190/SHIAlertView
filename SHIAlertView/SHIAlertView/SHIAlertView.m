//
//  SHIAlertView.m
//  SHIAlertView
//
//  Created by tomyKeisuke on 2015/10/31.
//  Copyright (c) 2015年 tomyKeisuke. All rights reserved.
//

#import "SHIAlertView.h"
#import "SHIColorSixteen.h"
#import "SHIButton.h"

@interface SHIAlertView ()
@property(nonatomic,retain,readonly)UIWindow* overrayWindow;
@property(nonatomic,strong)SHIButton* but;
@end

static SHIAlertView* shialert=nil;

#define BUTTON_HIDE_LINE 1
#define BUTTON_HEIGHT 50

static CGFloat baseViewheght = 0;

@implementation SHIAlertView

@synthesize overrayWindow;



-(UIWindow*)overrayWindow{
    if(!overrayWindow){
        overrayWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        overrayWindow.backgroundColor = [UIColor clearColor];
        overrayWindow.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
         [self gradiatorColor:@"#F7F7F7" endColor:@"#D7D7D7" alpha:0.3];
    }
    return overrayWindow;
}


+(SHIAlertView*)sharedView{
    
    if(!shialert)
        shialert = [[SHIAlertView alloc]init];
    
    return shialert;
}

/**
 *  初期関数
 *
 *  @return <#return value description#>
 */
-(instancetype)init{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        self.tag +=self.tag;
    }
    return self;
}

/**
 *  ベースとなるビュー
 *
 *  @param title
 *  @param descreption
 */
-(void)initializeView:(NSString*)title descreption:(NSString*)descreption{
    overrayWindow = self.overrayWindow;
    [overrayWindow makeKeyAndVisible];
    
    _baseView = self.baseViewer;
    _baseView.center = overrayWindow.center;
    [overrayWindow addSubview:_baseView];
    
    _title = [[SHILable alloc]initWithFrameTitle:CGRectMake(0, 10, 300, 40)];
    [_baseView addSubview:_title];
    _title.text = title;
    _message = [[SHILable alloc]initWithFrameDescreption:CGRectMake(0, 50, _baseView.frame.size.width, 60)];
    
    NSInteger numberLine = numberOfHeight(descreption);
    
    _message.text = descreption;
    _message.numberOfLines = numberLine;
    
    if(numberLine>=4){
        baseViewheght = numberLine*13;
        _message.frame = CGRectMake(_message.frame.origin.x,_message.frame.origin.y,_message.frame.size.width,_message.frame.size.height+(numberLine*20));
        
        _baseView.frame = CGRectMake(_baseView.frame.origin.x, _baseView.frame.origin.y-20, _baseView.frame.size.width, _baseView.frame.size.height+(numberLine*12));
    }
    
    [_baseView addSubview:_message];

}

NSInteger numberOfHeight(NSString* str){
    return str.length/28+1;
}

-(instancetype)initWithTitle:(NSString*)title
                 descreption:(NSString*)descreption delegate:(id)delegate cancelButton:(NSString*)buttonTitle otherButton:(NSString*)otherTitle{
    self = [super init];
    if(self){
        if(!delegate)
            _deleate = delegate;
        
        [self initializeView:title descreption:descreption];
        [self alertButton:@[buttonTitle,otherTitle]];
    }
    
    return self;
}

-(instancetype)initWithTitle:(NSString *)title descreption:(NSString *)descreption delegate:(id)delegate buttonArry:(NSArray*)buttonTitle{
    self = [super init];
    if(self){
        if(!delegate)
            _deleate = delegate;
        
        [self initializeView:title descreption:descreption];
        [self alertButton:buttonTitle];
    }
    return self;
}

-(void)showTitle:(NSString*)title descreption:(NSString*)descreption buttonTitle:(NSString*)buttonTitle {
    
    [self initializeView:title descreption:descreption];
    
    [self alertButton:@[buttonTitle]];
}

/**
 *  Button two Alert View
 *
 *  @param title       <#title description#>
 *  @param descreption <#descreption description#>
 *  @param buttonTitle <#buttonTitle description#>
 *  @param otherButton <#otherButton description#>
 */
-(void)showTitle:(NSString*)title descreption:(NSString*)descreption buttonTitle:(NSString*)buttonTitle otherTitle:(NSString*)otherButton{
    
    [self initializeView:title descreption:descreption];
    
    [self alertButton:@[buttonTitle,otherButton]];
}

-(void)showTitleAnyButton:(NSString *)title descreption:(NSString *)descreption buttonTitle:(NSArray *)buttonArray{
    [self initializeView:title descreption:descreption];
    
    [self alertButton:buttonArray];
}

-(void)alertShow{
    [UIView animateWithDuration:0.5f
                          delay:0.5f
                        options:(UIViewAnimationOptions) (UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction)
     
                     animations:^{
                         
                         _baseView.transform = CGAffineTransformScale(_baseView.transform, 0,0);
                         _title.transform = CGAffineTransformScale(_title.transform, 0, 0);
                         _message.transform = CGAffineTransformScale(_message.transform, 0, 0);
                         // アニメーションをする処理
                     } completion:^(BOOL finished) {
                         // アニメーションが終わった後実行する処理
                         _baseView.transform = CGAffineTransformScale(_baseView.transform, 100, 100);
                         _title.transform = CGAffineTransformScale(_title.transform, 1, 1);
                         _message.transform = CGAffineTransformScale(_message.transform, 1, 1);
                                                 
                     }];

}

-(UIView*)baseViewer{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 250)];
    view.backgroundColor = [UIColor whiteColor];
    view.clipsToBounds = YES;
    view.layer.cornerRadius = 20;
    return view;
    
}

-(void)dissmis{
    [UIView animateWithDuration:1.5f
                          delay:0.5f
                        options:(UIViewAnimationOptions) (UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction)

                     animations:^{
                         
                         _baseView.transform = CGAffineTransformScale(_baseView.transform, 1,1);
                         _title.transform = CGAffineTransformScale(_title.transform, 1, 1);
                         _message.transform = CGAffineTransformScale(_message.transform, 1, 1);
                     } completion:^(BOOL finished) {
                         _baseView.transform = CGAffineTransformScale(_baseView.transform, 0, 0);
                         _title.transform = CGAffineTransformScale(_title.transform, 0, 0);
                         _message.transform = CGAffineTransformScale(_message.transform, 0, 0);
                         overrayWindow = nil;
                         [overrayWindow removeFromSuperview];
                         [_baseView removeFromSuperview];
                         [_title removeFromSuperview];
                         [_message removeFromSuperview];
                         shialert = nil;

                     }];
}


-(void)showTile:(NSString*)title message:(NSString*)message delegate:(id)delegate {
    _title = [[SHILable alloc]initWithFrameTitle:CGRectMake(0, 10, 300, 40)];
    [_baseView addSubview:_title];
    _title.text = @"";
    _message = [[SHILable alloc]initWithFrameDescreption:CGRectMake(0, 80, _baseView.frame.size.width, 60)];
    _message.text = @"";
    [_baseView addSubview:_message];
}

NSInteger divisionNumbe(NSInteger num){
    return (num/2);
}

-(void)alertButton:(NSArray*)butttonTitle{
    NSInteger i = 0;
    
    for(;i<butttonTitle.count; i++){
        _but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_but setTitle:butttonTitle[i] forState:UIControlStateNormal];
        _but = setButton(_but, i);
        
        switch (butttonTitle.count){
            case 1: _but.frame = CGRectMake(-BUTTON_HIDE_LINE, _baseView.frame.size.width-100+baseViewheght, _baseView.frame.size.width+2, 51);
                break;
            case 2: _but.frame = CGRectMake((divisionNumbe(_baseView.frame.size.width)*i)-1,  _baseView.frame.size.width-100+baseViewheght, divisionNumbe(_baseView.frame.size.width)+1.5, 50+BUTTON_HIDE_LINE);
                
                break;
            case 3:{
                //_but.frame = CGRectMake(-1,  (_baseView.frame.size.width-(BUTTON_HEIGHT*2))+(i*(BUTTON_HEIGHT+10))+baseViewheght, _baseView.frame.size.width+2, BUTTON_HEIGHT);
                _but.frame = CGRectMake(-1,  _baseView.frame.size.width-(BUTTON_HEIGHT*(3-i))+baseViewheght, _baseView.frame.size.width+2, BUTTON_HEIGHT);
                
                _baseView.frame = CGRectMake(_baseView.frame.origin.x, _baseView.frame.origin.y-20, _baseView.frame.size.width, _baseView.frame.size.height+16);
            }
                break;
            case 4:{
                //_but.frame = CGRectMake(10,  (_baseView.frame.size.width-(BUTTON_HEIGHT*2))+(i*(BUTTON_HEIGHT+10))+baseViewheght, _baseView.frame.size.width-20+BUTTON_HIDE_LINE, BUTTON_HEIGHT);
                _but.frame = CGRectMake(-1,  _baseView.frame.size.width-(BUTTON_HEIGHT*(4-i))+(baseViewheght+30)+15, _baseView.frame.size.width+2, BUTTON_HEIGHT);
                
                _baseView.frame = CGRectMake(_baseView.frame.origin.x, _baseView.frame.origin.y-20, _baseView.frame.size.width, _baseView.frame.size.height+30);
                }break;
            case 5:{
                //_but.frame = CGRectMake(10,  (_baseView.frame.size.width-(BUTTON_HEIGHT*2))+(i*(BUTTON_HEIGHT+10))+baseViewheght, _baseView.frame.size.width-20+BUTTON_HIDE_LINE, BUTTON_HEIGHT);
                _but.frame = CGRectMake(-1,  _baseView.frame.size.width-(BUTTON_HEIGHT*(4-i))+baseViewheght+45, _baseView.frame.size.width+2, BUTTON_HEIGHT);
                _baseView.frame = CGRectMake(_baseView.frame.origin.x, _baseView.frame.origin.y-20, _baseView.frame.size.width, _baseView.frame.size.height+30);
            }break;
                
            default:
                NSLog(@"\nSHIALERT SORRY NOT DEVELOP\n　developing now dude!\n");
                break;
        }
        [_but addTarget:self action:@selector(alertButtonPush:) forControlEvents:UIControlEventTouchUpInside];
        [_baseView addSubview:_but];
    }
}

-(void)alertButtonPush:(SHIButton*)but{
    if(self.deleate)
        [_deleate shiAlertView:self clickButtonIndex:but.tag];
    
    [self dissmis];
    
    
}

-(void)gradiatorColor:(NSString*)start endColor:(NSString*)endcolor alpha:(float)alpha{
    
    CAGradientLayer *gradation = [CAGradientLayer layer];
    
    gradation.frame = overrayWindow.bounds;
    
    gradation.colors = @[
                         // 開始色
                         (id)[SHIColorSixteen colorCovertSixteen:start alpha:alpha].CGColor,
                         // 終了色
                         (id)[SHIColorSixteen colorCovertSixteen:endcolor alpha:alpha].CGColor
                         ];
    [overrayWindow.layer insertSublayer:gradation atIndex:0];
    
}
@end
