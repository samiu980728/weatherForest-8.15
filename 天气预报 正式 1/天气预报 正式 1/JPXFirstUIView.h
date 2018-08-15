//
//  JPXFirstUIView.h
//  天气预报 正式 1
//
//  Created by 萨缪 on 2018/8/14.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPXFirstUIView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>
{
    UITableView * _tableView;
    
    NSMutableArray * pushTimearray;
    
    NSMutableArray * pushNameArray;
    
    NSMutableArray * pushTempArray;
    
    NSMutableArray * cond_txtArray;
    
    NSMutableArray * tmpMaxArray;
    
    NSMutableArray * tmpMinArray;
    
    NSMutableArray * tmpMaxArray1;
    
    NSMutableArray * tmpMinArray1;
    
    NSMutableArray * tmpMaxArray2;
    
    NSMutableArray * tmpMinArray2;
    
    NSMutableArray * weatherStatesArray;
    
    NSMutableArray * weatherStatesArray1;
    
    NSMutableArray * weatherStatesArray2;
    //应该给各个tableView赋值了
}
@property (nonatomic, copy) NSString * fCNameStr;


- (instancetype)initWithFrame:(CGRect)frame andcityString:(NSString *)ciString;



@end
