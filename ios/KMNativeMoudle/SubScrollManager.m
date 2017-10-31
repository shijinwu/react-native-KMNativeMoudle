//
//  SubScrollManager.m
//  TmallDetail
//
//  Created by mac on 2017/9/30.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "SubScrollManager.h"
#import "SubScrollView.h"
@interface SubScrollManager ()<UIScrollViewDelegate>
{
    float height;
    float width;
    float ofSetY;
}
@property (nonatomic,assign)float contentSizeHeight;
@property (nonatomic,assign)float contentSizeWidth;
@property (nonatomic,assign)BOOL up;
@property (nonatomic,strong)SubScrollView *sv;

@end
@implementation SubScrollManager

RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(up, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onWillEndDragging, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onSubScroll, RCTBubblingEventBlock)
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

- (UIView *)view
{
    height = [UIScreen mainScreen].bounds.size.height;
    width = [UIScreen mainScreen].bounds.size.width;
    ofSetY = 80;
  self.sv=[[SubScrollView alloc] init];
  self.sv.delegate = self;
  self.sv.contentSize = CGSizeMake(width, height*2);
  self.contentSizeHeight = height*2;
  self.contentSizeWidth = width;
  return self.sv;
}

-(void)scrollViewDidScroll:(SubScrollView *)scrollView{
  if(!scrollView.onSubScroll){
    return;
  } scrollView.onSubScroll(@{@"x":@(scrollView.contentOffset.x),@"y":@(scrollView.contentOffset.y)});
}
-(void)scrollViewWillEndDragging:(SubScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
 
  if(!scrollView.onWillEndDragging){
    return;
  }
  float y = scrollView.contentOffset.y;
  
  NSLog(@"y = %f height = %f",y,self.contentSizeHeight);
  
  if(scrollView.up){
    if(y > (self.contentSizeHeight -height + ofSetY)){
      scrollView.onWillEndDragging(@{@"height":@(height)});
    }
  }
  else {
    if(y < (-ofSetY)){
      scrollView.onWillEndDragging(@{@"height":@0});
    }
  }
  
}
@end
