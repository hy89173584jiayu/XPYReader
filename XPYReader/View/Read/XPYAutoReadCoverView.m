//
//  XPYAutoReadCoverView.m
//  XPYReader
//
//  Created by zhangdu_imac on 2020/8/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYAutoReadCoverView.h"
#import "XPYReadView.h"

#import "XPYChapterModel.h"
#import "XPYChapterPageModel.h"

#import "XPYReadParser.h"

@interface XPYAutoReadCoverView ()

/// 覆盖视图上阅读视图
@property (nonatomic, strong) XPYReadView *coverReadView;
/// 覆盖模式阅读进度位置
@property (nonatomic, strong) UIImageView *coverImageView;

@property (nonatomic, strong) XPYChapterModel *chapterModel;
@property (nonatomic, strong) XPYChapterPageModel *pageModel;

@end

@implementation XPYAutoReadCoverView

#pragma mark - Initializer
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}

#pragma mark - Instance methods
- (void)updateCurrentChapter:(XPYChapterModel *)chapter pageModel:(nonnull XPYChapterPageModel *)pageModel {
    if (!chapter) {
        return;
    }
    self.chapterModel = [chapter copy];
    self.pageModel = [pageModel copy];
    [self.coverReadView setupContent:self.pageModel.pageContent];
}

#pragma mark - UI
- (void)configureUI {
    self.backgroundColor = [XPYReadConfigManager sharedInstance].currentBackgroundColor;
    self.clipsToBounds = YES;
    
    [self addSubview:self.coverReadView];
    
    [self addSubview:self.coverImageView];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.leading.trailing.equalTo(self);
        make.height.mas_offset(kXPYCoverViewMinHeight);
    }];
}

#pragma mark - Getters
- (XPYReadView *)coverReadView {
    if (!_coverReadView) {
        _coverReadView = [[XPYReadView alloc] initWithFrame:CGRectMake(XPYReadViewLeftSpacing, kXPYCoverViewMinHeight, XPYReadViewWidth, XPYReadViewHeight)];
    }
    return _coverReadView;
}
- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] initWithImage:[XPYReadConfigManager sharedInstance].isDarkMode ? [UIImage imageNamed:@"reading_self_motion_night"] : [UIImage imageNamed:@"reading_self_motion"]];
        _coverImageView.backgroundColor = [XPYReadConfigManager sharedInstance].currentBackgroundColor;
    }
    return _coverImageView;
}

@end
