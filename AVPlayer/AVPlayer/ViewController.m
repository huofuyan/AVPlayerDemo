//
//  ViewController.m
//  AVPlayer
//
//  Created by apple on 2017/11/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (nonatomic, strong) AVPlayerViewController *playerVC;

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _playerVC = [[AVPlayerViewController alloc] init];
    
   
    
    
    
    [self demo2];
}

-  (void) demo2 {
    NSString *urlStr = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
    
//    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURL *movieUrl = [NSURL URLWithString:urlStr];
    
    self.player = [AVPlayer playerWithURL:movieUrl];
    
    self.playerVC.player = self.player;
    
    self.playerVC.view.frame = self.view.bounds;
    
    self.playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
    
//    self.playerVC.delegate = self;
    
    [self.view addSubview:self.playerVC.view];
    
    [self.playerVC.player play];
}


- (void)demo {
    
    
    
    NSString *urlStr = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    AVPlayer *avPlayer = [AVPlayer playerWithURL:url];
    
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    
    playerVC.player = avPlayer;
    
    playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
    
    playerVC.view.frame = self.view.bounds;
    
    //    [self addChildViewController:playerVC];
    
    [self.view addSubview:playerVC.view];
    
    [playerVC.player play];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
