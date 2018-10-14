//
//  VoteView.m
//  IMM' Situ
//
//  Created by Morgan Berger on 24/08/2017.
//  Copyright © 2017 Morgan Berger. All rights reserved.
//

#import "VoteView.h"


@implementation VoteView

IB_DESIGNABLE
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
        
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    _baseGray = -1;
    _spaceBetweenViews = 0.0;
    
    return self;
}

//- (void)prepareForInterfaceBuilder {
//    _numberOfViews = 5;
//}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    _numberOfViews = ([_delegate respondsToSelector:@selector(setImageNumber)] ? _delegate.setImageNumber : _numberOfViews);
    
    _imgSelected = ([_delegate respondsToSelector:@selector(setSelectedImgName)] ? _delegate.setSelectedImgName : _imgSelected);
    
    _imgUnselected = ([_delegate respondsToSelector:@selector(setUnselectedImgName)] ? _delegate.setUnselectedImgName : _imgUnselected);

    
    CGFloat w = rect.size.width / _numberOfViews;
    CGFloat h = rect.size.height;
    
    if (_baseGray <= 0) {
        _baseGray = 200;
    }
    
    UIColor *color = [[UIColor alloc] initWithRed:_baseGray/255.0 green:_baseGray/255.0 blue:_baseGray/255.0 alpha:1.0];
    
    for (int i = 0; i < _numberOfViews; i++) {

        UIImageView *imgView = [[UIImageView alloc] init];

        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        imgView.frame = CGRectMake(w * i + _spaceBetweenViews / 2, 0, w - _spaceBetweenViews, h);
        imgView.image = i < _voteResult ? self.imgSelected : self.imgUnselected;
        imgView.tag = i;
        
        imgView.backgroundColor = (imgView.image != nil ? UIColor.clearColor : color);

        CGFloat shadeOfGray = (_baseGray + ((i + 1) * -15)) / 255.0;
        
        color = [[UIColor alloc] initWithRed:shadeOfGray green:shadeOfGray blue:shadeOfGray alpha:1.0];
        
        [self addSubview:imgView];
    }

    _imageViews = self.subviews;

    [self setUserInteractionEnabled:YES];

    _voteResult = 0;

    for (UIImageView* img in _imageViews) {

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedStar:)];

        [img addGestureRecognizer:tap];
        [img setUserInteractionEnabled:YES];
    }
}

- (void)userTappedStar:(UITapGestureRecognizer*)sender {
    
    int index = (int)sender.view.tag;
    
    [self selectStarsToIndex:index];
    
    if (_voteResult != index + 1){
        _voteResult = index + 1;
        [self voteDidChange];
    }
}

- (void)selectStarsToIndex:(int)index {
    
    for (int i = 0; i < _imageViews.count; i++) {
        [_imageViews[i] setImage:(i <= index ? self.imgSelected : self.imgUnselected)];
    }
}

- (void)setNote:(int)note {
//    if (note != 0) {
        [self selectStarsToIndex:note - 1];
//    }
}

//#pragma mark - VoteViewDelegate methods // another day maybe
//
- (void)voteDidChange {
    if (self.delegate && [self.delegate respondsToSelector:@selector(voteDidChange:)]) {
        [self.delegate voteDidChange:_voteResult];
    }
}


@end
