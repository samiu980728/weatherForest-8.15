//
//  MainViewController.m
//  天气预报 正式 1
//
//  Created by 萨缪 on 2018/8/14.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "MainViewController.h"
#import "JPXFirstUIView.h"
#import "JPXSecondUIView.h"
#import "JPXThreeUIView.h"

@interface MainViewController ()
//屏幕宽

#define kScreenW [UIScreen mainScreen].bounds.size.width

//屏幕高

#define kScreenH [UIScreen mainScreen].bounds.size.height
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建滚动界面
    UIScrollView * mainScrollView = [[UIScrollView alloc] init];
    mainScrollView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    //是否整页滚动
    mainScrollView.pagingEnabled = YES;
    //是否可以开启滚动效果
    mainScrollView.scrollEnabled = YES;
    
    //设置画布大小
    //刚好能滑动6个
    mainScrollView.contentSize = CGSizeMake(kScreenW*_cNameArray.count, kScreenH);
    mainScrollView.bounces = NO;
    
    //横向 纵向弹动效果
   // mainScrollView.alwaysBounceVertical = YES;
   // mainScrollView.alwaysBounceHorizontal = YES;
    //显示水平滚动条
    mainScrollView.showsHorizontalScrollIndicator = YES;
    
    mainScrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.jpg"]];
    
    
    //得先把它加上 再加下面的那个
    [self.view addSubview:mainScrollView];
    
    
    //添加UIView
    //先把城市数据传递到这里 再通过属性传值传到各个滚动界面
    
    
    //JPXFirstUIView * firstUIView = [[JPXFirstUIView alloc] init];
    //怎么判断 是否建立几个滚动视图呢？ 对 _pushFirstNameStr 这个得用数组来装
    //然后遍历数组来找到 
    
    //遍历cNameArray数组 分别将数组的各个单元赋值给 不同UIView的cityString
    
    //还没加for循环遍历数组之前 每找到数组中一个单位的元素 就创建一个UIView
    
    NSLog(@"[_cNameArray count] ++++++ = %li",[_cNameArray count]);
    
    for (NSInteger i = 0;  i < [_cNameArray count]; i++) {
        NSLog(@"i = %li",i);
//        if ( i == 0 ){
            JPXFirstUIView * firstUIView = [[JPXFirstUIView alloc] initWithFrame:CGRectMake(kScreenW*i, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) andcityString:[NSString stringWithFormat:@"%@",_cNameArray[i]]];
            
            
//            firstUIView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            
            //得先把它加上 再加下面的那个
            //[self.view addSubview:mainScrollView];
            
            [mainScrollView addSubview:firstUIView];
//        }
//        else if (i == 1){
//            JPXSecondUIView * secondUIView = [[JPXSecondUIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) andcityString:[NSString stringWithFormat:@"%@",_cNameArray[i]]];
//
//
//            secondUIView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//            [mainScrollView addSubview:secondUIView];
//        }
//        else if ( i == 2 ){
//            JPXThreeUIView * thirdUIView = [[JPXThreeUIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) andcityString:[NSString stringWithFormat:@"%@",_cNameArray[i]]];
//
//
//            thirdUIView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//            [mainScrollView addSubview:thirdUIView];
//        }
    }
    
    
    self.bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.bottomButton.frame = CGRectMake(kScreenW - 35, kScreenH - 35, 30, 30);
    
    [self.bottomButton setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    
    [self.bottomButton addTarget:self action:@selector(onTapLiveBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.bottomButton];
}

- (void)onTapLiveBtn
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
