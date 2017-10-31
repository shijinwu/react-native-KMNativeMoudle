//
//  VerticalScrollView.m
//  天猫详情页
//
//  Created by mac on 2017/9/29.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VerticalScrollView.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
@interface VerticalScrollView ()<UIScrollViewDelegate>
{
  float width;
  float height;
  float ofSetY;
}
@end

@implementation VerticalScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {

  }
  return self;
}


@end

