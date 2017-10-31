//
//  SubScrollView.h
//  TmallDetail
//
//  Created by mac on 2017/10/9.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>
@interface SubScrollView : UIScrollView
@property (nonatomic, assign)BOOL up;
@property (nonatomic, copy) RCTBubblingEventBlock onSubScroll;
@property (nonatomic, copy) RCTBubblingEventBlock onWillEndDragging;
@end
