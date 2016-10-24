//
//  ViewController.m
//  List_Grid
//
//  Created by lingzhi on 2016/10/24.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "ViewController.h"
#import "GridListCollectionViewCell.h"
#import "GridListModel.h"

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    BOOL _isGrid;
}

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UIButton *changeButton;



@end

@implementation ViewController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (UIButton *)changeButton
{
    if (_changeButton == nil) {
        _changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeButton.frame = CGRectMake(0, 0, 40, 40);

        [_changeButton setImage:[UIImage imageNamed:@"product_list_list_btn@2x"] forState:UIControlStateNormal];
         [_changeButton setImage:[UIImage imageNamed:@"product_list_list_btn@2x"] forState:UIControlStateSelected];
        [_changeButton addTarget:self action:@selector(changeAction) forControlEvents:UIControlEventTouchUpInside];
                         
    }
    return _changeButton;
}

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        
        
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        //设置滚动方向
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //设置左右间距
        flowLayout.minimumInteritemSpacing = 2;
        //设置上下间距
        flowLayout.minimumLineSpacing = 2;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(2, 2, self.view.bounds.size.width-4, self.view.bounds.size.height-4) collectionViewLayout:flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[GridListCollectionViewCell class] forCellWithReuseIdentifier:@"GridListCollectionViewCell"];
        
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //默认为列表视图
    _isGrid = NO;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"product" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"dict= %@",dict);
    
    
    NSArray *products = dict[@"wareInfo"];
    for (NSDictionary *dict in products) {
        GridListModel *model = [GridListModel modelWithDictionary:dict];
        [self.dataArray addObject:model];
    }

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:self.changeButton];
    self.navigationItem.rightBarButtonItem = barItem;
    
    [self.view addSubview:self.collectionView];
    
}

#pragma mark- UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GridListModel *model = (GridListModel *)self.dataArray[indexPath.row];

    GridListCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridListCollectionViewCell" forIndexPath:indexPath];
    
    item.isGrid = _isGrid;
    item.model = model;
    return item;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isGrid)
    {
        return CGSizeMake((ScreenWidth-6)/2, (ScreenWidth-6)/2+40);
    }
    else
    {
        return CGSizeMake(ScreenWidth-4, (ScreenWidth-6)/4+20);
    }
}

- (void)changeAction
{
    _isGrid = !_isGrid;
    [self.collectionView reloadData];
    
    if (_isGrid)
    {
        [self.changeButton setImage:[UIImage imageNamed:@"product_list_grid_btn"] forState:UIControlStateNormal];
        [self.changeButton setImage:[UIImage imageNamed:@"product_list_grid_btn"] forState:UIControlStateSelected];
    }
    else
    {
        [self.changeButton setImage:[UIImage imageNamed:@"product_list_list_btn"] forState:UIControlStateNormal];
        [self.changeButton setImage:[UIImage imageNamed:@"product_list_list_btn"] forState:UIControlStateSelected];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
