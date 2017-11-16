//
//  H_CollectionViewCell.m
//  AVPlayer
//
//  Created by apple on 2017/11/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "H_CollectionViewCell.h"

#import <AVKit/AVKit.h>

@implementation H_CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
    }
    return self;
}



- (void)setMoviePath:(NSString *)moviePath {
    _moviePath = moviePath;
    [self setupUI];
}

- (void)setupUI {
    
    NSString *urlStr = self.moviePath;
    
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    
    
    
//    [playerVC.player play];
    
    __weak typeof(self) weakSelf = self;
    
    self.myBlock = ^{
        
        AVPlayer *avPlayer = [AVPlayer playerWithURL:url];
        
        AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
        
        playerVC.showsPlaybackControls = NO;
        
        playerVC.view.backgroundColor = [UIColor whiteColor];
        
        playerVC.player = avPlayer;
        
        playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
        
        playerVC.view.frame = weakSelf.contentView.bounds;
        
        //    [self addChildViewController:playerVC];
        
        [weakSelf.contentView addSubview:playerVC.view];
        
        [playerVC.player play];
    };
    
}


@end
