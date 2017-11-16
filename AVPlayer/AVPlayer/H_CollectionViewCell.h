//
//  H_CollectionViewCell.h
//  AVPlayer
//
//  Created by apple on 2017/11/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^startBlock)(void);

@interface H_CollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString* moviePath;

@property (nonatomic, copy) startBlock myBlock;

@end
