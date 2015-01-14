//
//  ViewController.m
//  ASTextStretch
//
//  Created by Łukasz Jerciński on 14/01/15.
//  Copyright (c) 2015 Łukasz Jerciński. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ASTextNode *textNode1 = [self textNode];
    ASTextNode *textNode2 = [self textNode];
    
    textNode1.frame = (CGRect){{30, 30}, textNode1.calculatedSize};
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize pixelCeilSize = (CGSize){roundf(textNode2.calculatedSize.width * scale) / scale, roundf(textNode2.calculatedSize.height * scale) / scale};
    textNode2.frame = (CGRect){{30, 100}, pixelCeilSize};
    
    NSLog(@"textNode1 size: %@", NSStringFromCGSize(textNode1.bounds.size));
    NSLog(@"textNode2 size: %@", NSStringFromCGSize(textNode2.bounds.size));
    
    [self.view addSubview:textNode1.view];
    [self.view addSubview:textNode2.view];
}

- (ASTextNode *)textNode {
    ASTextNode *textNode = [[ASTextNode alloc] init];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:19]
                                 };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"Run this on iPhone 6 Plus and enable \"Color Misaligned Images\"" attributes:attributes];
    
    textNode.attributedString = attributedString;
    [textNode measure:CGSizeMake(300, CGFLOAT_MAX)];
    
    return textNode;
}

@end
