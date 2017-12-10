//
//  SQTableViewController.m
//  SQMenuShowView
//
//  Created by yangsq on 16/9/23.
//  Copyright © 2016年 yangsq. All rights reserved.
//

#import "SQTableViewController.h"
#import "SQMenuShowView.h"

@interface SQTableViewController ()


@property (strong, nonatomic)  SQMenuShowView *showView;
@property (assign, nonatomic)  BOOL  isShow;
@end

@implementation SQTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]){
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"show"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(show)];
    
    
    __weak typeof(self) weakSelf = self;
    [self.showView selectBlock:^(SQMenuShowView *view, NSInteger index) {
        weakSelf.isShow = NO;
        NSLog(@"点击第%ld个item",index+1);
    }];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _isShow = NO;
    [self.showView dismissView];
}

- (SQMenuShowView *)showView{
    
    if (_showView) {
        return _showView;
    }
    
    _showView = [[SQMenuShowView alloc]initWithFrame:(CGRect){CGRectGetWidth(self.view.frame)-100-10,64+5,100,0}
                                               items:@[@"item1",@"item2",@"item3"]
                                           showPoint:(CGPoint){CGRectGetWidth(self.view.frame)-25,10}];
    _showView.sq_backGroundColor = [UIColor whiteColor];
    _showView.itemTextColor = [UIColor blackColor];
    _showView.sq_selectColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:_showView];
    return _showView;
}


- (void)show{
    _isShow = !_isShow;
    
    if (_isShow) {
        [self.showView showView];

    }else{
        [self.showView dismissView];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
