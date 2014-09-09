//
//  StyleKitName.m
//  ProjectName
//
//  Created by AuthorName on 8/11/14.
//  Copyright (c) 2014 CompanyName. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "StyleKitName.h"


@implementation StyleKitName

#pragma mark Cache

static UIColor* _color = nil;
static UIColor* _color2 = nil;
static UIColor* _color5 = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _color = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
    CGFloat colorRGBA[4];
    [_color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];

    CGFloat colorHSBA[4];
    [_color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];

    _color2 = [UIColor colorWithRed: (colorRGBA[0] * 0.5 + 0.5) green: (colorRGBA[1] * 0.5 + 0.5) blue: (colorRGBA[2] * 0.5 + 0.5) alpha: (colorRGBA[3] * 0.5 + 0.5)];
    _color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.3 + 0.7) green: (colorRGBA[1] * 0.3 + 0.7) blue: (colorRGBA[2] * 0.3 + 0.7) alpha: (colorRGBA[3] * 0.3 + 0.7)];

}

#pragma mark Colors

+ (UIColor*)color { return _color; }
+ (UIColor*)color2 { return _color2; }
+ (UIColor*)color5 { return _color5; }

#pragma mark Drawing Methods

+ (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    CGFloat colorHSBA[4];
    [StyleKitName.color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];

    UIColor* color4 = [UIColor colorWithHue: colorHSBA[0] saturation: colorHSBA[1] brightness: 0.9 alpha: colorHSBA[3]];
    UIColor* gradientColor = [UIColor colorWithRed: 1 green: 0.736 blue: 0.736 alpha: 0];

    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0, 0.99};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)UIColor.redColor.CGColor, (id)[UIColor colorWithRed: 1 green: 0.368 blue: 0.368 alpha: 0.5].CGColor, (id)gradientColor.CGColor], gradientLocations);

    //// Shadow Declarations
    UIColor* shadow = UIColor.blackColor;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 5;
    UIColor* circleShadow = UIColor.blackColor;
    CGSize circleShadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat circleShadowBlurRadius = 5;

    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(14, 12, 177, 201)];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGContextDrawLinearGradient(context, gradient,
        CGPointMake(250.33, 108.89),
        CGPointMake(-55.13, 114.89),
        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, circleShadowOffset, circleShadowBlurRadius, [circleShadow CGColor]);
    [color4 setStroke];
    ovalPath.lineWidth = 4;
    [ovalPath stroke];
    CGContextRestoreGState(context);


    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(122, 92)];
    [bezier2Path addLineToPoint: CGPointMake(122, 54)];
    [bezier2Path addLineToPoint: CGPointMake(103.5, 30.5)];
    [bezier2Path addLineToPoint: CGPointMake(83, 54)];
    [bezier2Path addCurveToPoint: CGPointMake(83.47, 91.81) controlPoint1: CGPointMake(83, 54) controlPoint2: CGPointMake(80.91, 87.89)];
    [bezier2Path addCurveToPoint: CGPointMake(103.5, 114.5) controlPoint1: CGPointMake(91.99, 104.87) controlPoint2: CGPointMake(103.5, 114.5)];
    [bezier2Path addLineToPoint: CGPointMake(122, 142)];
    [bezier2Path addLineToPoint: CGPointMake(122, 177)];
    [bezier2Path addLineToPoint: CGPointMake(103.5, 195.5)];
    [bezier2Path addLineToPoint: CGPointMake(83, 177)];
    [bezier2Path addLineToPoint: CGPointMake(83, 142)];
    [bezier2Path addLineToPoint: CGPointMake(103.5, 114.5)];
    [bezier2Path addLineToPoint: CGPointMake(122, 92)];
    [bezier2Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [StyleKitName.color setStroke];
    bezier2Path.lineWidth = 6;
    [bezier2Path stroke];
    CGContextRestoreGState(context);


    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(122, 92)];
    [bezierPath addLineToPoint: CGPointMake(122, 54)];
    [bezierPath addLineToPoint: CGPointMake(103.5, 30.5)];
    [bezierPath addLineToPoint: CGPointMake(83, 54)];
    [bezierPath addCurveToPoint: CGPointMake(83.47, 91.81) controlPoint1: CGPointMake(83, 54) controlPoint2: CGPointMake(80.91, 87.89)];
    [bezierPath addCurveToPoint: CGPointMake(103.5, 114.5) controlPoint1: CGPointMake(91.99, 104.87) controlPoint2: CGPointMake(103.5, 114.5)];
    [bezierPath addLineToPoint: CGPointMake(122, 142)];
    [bezierPath addLineToPoint: CGPointMake(122, 177)];
    [bezierPath addLineToPoint: CGPointMake(103.5, 195.5)];
    [bezierPath addLineToPoint: CGPointMake(83, 177)];
    [bezierPath addLineToPoint: CGPointMake(83, 142)];
    [bezierPath addLineToPoint: CGPointMake(103.5, 114.5)];
    [bezierPath addLineToPoint: CGPointMake(122, 92)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [StyleKitName.color2 setStroke];
    bezierPath.lineWidth = 4;
    [bezierPath stroke];
    CGContextRestoreGState(context);


    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake(122, 91)];
    [bezier3Path addLineToPoint: CGPointMake(122, 53)];
    [bezier3Path addLineToPoint: CGPointMake(103.5, 29.5)];
    [bezier3Path addLineToPoint: CGPointMake(83, 53)];
    [bezier3Path addCurveToPoint: CGPointMake(83.47, 90.81) controlPoint1: CGPointMake(83, 53) controlPoint2: CGPointMake(80.91, 86.89)];
    [bezier3Path addCurveToPoint: CGPointMake(103.5, 113.5) controlPoint1: CGPointMake(91.99, 103.87) controlPoint2: CGPointMake(103.5, 113.5)];
    [bezier3Path addLineToPoint: CGPointMake(122, 141)];
    [bezier3Path addLineToPoint: CGPointMake(122, 176)];
    [bezier3Path addLineToPoint: CGPointMake(103.5, 194.5)];
    [bezier3Path addLineToPoint: CGPointMake(83, 176)];
    [bezier3Path addLineToPoint: CGPointMake(83, 141)];
    [bezier3Path addLineToPoint: CGPointMake(103.5, 113.5)];
    [bezier3Path addLineToPoint: CGPointMake(122, 91)];
    [bezier3Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [StyleKitName.color5 setStroke];
    bezier3Path.lineWidth = 2;
    [bezier3Path stroke];
    CGContextRestoreGState(context);


    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(14, 12, 177, 201)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, circleShadowOffset, circleShadowBlurRadius, [circleShadow CGColor]);
    [StyleKitName.color5 setStroke];
    oval2Path.lineWidth = 2;
    [oval2Path stroke];
    CGContextRestoreGState(context);


    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
