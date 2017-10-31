//
//  VerticalScrollViewManager.m
//  TmallDetail
//
//  Created by mac on 2017/9/29.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "VerticalScrollManager.h"


@interface VerticalScrollManager ()

@property (nonatomic,strong)VerticalScrollView *vs;
@property (nonatomic,assign)BOOL addSubView;

@end

@implementation VerticalScrollManager


RCT_EXPORT_MODULE()
RCT_CUSTOM_VIEW_PROPERTY(contentOffset, CGPoint,VerticalScrollView)
{
  if(json){
  NSDictionary *dic =[RCTConvert NSDictionary:json];
  [view setContentOffset:CGPointMake([dic[@"x"] floatValue], [dic[@"y"] floatValue]) animated:YES];
  }
}
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

- (UIView *)view
{
  self.vs=[[VerticalScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.vs.contentOffset =CGPointMake(0, 0);
  return self.vs;
}







@end
