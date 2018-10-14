//
//  VoteView.h
//  IMM' Situ
//
//  Created by Morgan Berger on 24/08/2017.
//  Copyright © 2017 Morgan Berger. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "UIView+Utils.h"
//#import "UIImage+Utils.h"

@protocol VoteViewDelegate <NSObject>

@optional
- (void)voteDidChange:(int)voteResult;
- (UIImage*)setSelectedImgName;
- (UIImage*)setUnselectedImgName;
- (int)setImageNumber;

@end

IB_DESIGNABLE
@interface VoteView : UIView

@property (nonatomic, weak) id <VoteViewDelegate> delegate;

@property NSArray<UIImageView*> *imageViews;

@property IBInspectable int numberOfViews;

@property IBInspectable UIImage *imgSelected;
@property IBInspectable UIImage *imgUnselected;

@property IBInspectable CGFloat spaceBetweenViews;

@property IBInspectable CGFloat baseGray;

@property int voteResult;

- (void)setNote:(int)note;

@end
