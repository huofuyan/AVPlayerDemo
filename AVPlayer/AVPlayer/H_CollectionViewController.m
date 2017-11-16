//
//  H_CollectionViewController.m
//  AVPlayer
//
//  Created by apple on 2017/11/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "H_CollectionViewController.h"

#import "H_CollectionViewCell.h"

@interface H_flowLayout:UICollectionViewFlowLayout

@end

@implementation H_flowLayout

- (void)prepareLayout {
    
    
    
}

@end
@interface H_CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *arrayM;



@end

@implementation H_CollectionViewController
static NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    
    
    // 设置布局属性
    // 1> 格子大小
    layout.itemSize = self.view.bounds.size;
    // 最小行间距
    layout.minimumLineSpacing = 0;
    // 最小格子间距 - 如果剩余距离不足以放下一个格子，collectionView 会自定计算和调整间距
    layout.minimumInteritemSpacing = 0;
    // 分组间距
    //    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    collectionView.showsVerticalScrollIndicator = NO;
    
    collectionView.pagingEnabled = YES;
    
    collectionView.bounces = NO;
    
    collectionView.backgroundColor = [UIColor orangeColor];
    
    [collectionView registerClass:[H_CollectionViewCell class] forCellWithReuseIdentifier:cellId];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [self.view addSubview:collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.arrayM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1. 取 cell
    H_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
//    H_CollectionViewCell *cell = [H_CollectionViewCell cellForItemAtIndexPath:indexPath];
    
    
    // 2. 设置 cell
    cell.backgroundColor = [UIColor redColor];
    
    cell.moviePath = self.arrayM[indexPath.row];
    
    
    
//    NSLog(@"%ld.....row",(long)indexPath.row);
    
    // 3. 返回 cell
    return cell;
}


- (NSMutableArray *)arrayM {
    
    if (!_arrayM) {
        
     
        
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i<4; i++) {
            [array addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"guide%d",i] ofType:@"mp4"]];

            _arrayM = array;
    }
        return _arrayM;
    }
        return _arrayM;
}



- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    H_CollectionViewCell *currentCell = (H_CollectionViewCell *)cell;
    
    NSLog(@"currentCell--- %p",currentCell);
    
    currentCell.myBlock();
    
    NSLog(@"当前显示的cell。row %ld",indexPath.row);
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger i = indexPath.row + 1;
    
    NSIndexPath *nextPath = [NSIndexPath indexPathWithIndex:i];
    
   H_CollectionViewCell *CellNew = [collectionView cellForItemAtIndexPath:nextPath];
    
    NSLog(@"CellNew--- %p",CellNew);
    
    
    
    NSLog(@"已经显示cell。row %ld",indexPath.row);
}

@end
