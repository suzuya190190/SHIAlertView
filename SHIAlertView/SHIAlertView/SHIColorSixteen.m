//
//  colorHex.m
//  fpBird
//
//  Created by tomyAmi on 2015/02/07.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIColorSixteen.h"

@implementation SHIColorSixteen

+ (UIColor *)colorCovertSixteen:(NSString *)colorNumber alpha:(CGFloat)alpha
{
    NSString *shiColorCode;
    const char *colorString;
    char *shiStr;
    
    if ([[colorNumber substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"#"]) {
        colorNumber = [colorNumber substringWithRange:NSMakeRange(1, colorNumber.length - 1)];
    }
    
    if (colorNumber.length == 3) {
        colorNumber = [SHIColorSixteen stringAdd:colorNumber];
    }
    
    CGFloat redValue=0.0, greenValue=0.0, blueValue = 0.0;
    
    for (NSInteger i = 0; i < 3; i++) {
        shiColorCode = [NSString stringWithFormat:@"+0x%@", [colorNumber substringWithRange:NSMakeRange(i * 2, 2)]];
        colorString    = [shiColorCode cStringUsingEncoding:NSASCIIStringEncoding];
        
        switch (i) {
            case 0:
                redValue   = strtol(colorString, &shiStr, 16);
                break;
                
            case 1:
                greenValue = strtol(colorString, &shiStr, 16);
                break;
                
            case 2:
                blueValue  = strtol(colorString, &shiStr, 16);
                
            default:
                break;
        }
    }
    
    return [UIColor colorWithRed:redValue / 255.0 green:greenValue / 255.0 blue:blueValue / 255.0 alpha:alpha];
}

+(NSString*)stringAdd:(NSString*)string {
    NSMutableString *_colorCode = [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < string.length; i++) {
        [_colorCode appendString:[string substringWithRange:NSMakeRange(i, 1)]];
        [_colorCode appendString:[string substringWithRange:NSMakeRange(i, 1)]];
    }
    string = [_colorCode copy];
    return string;
}

@end