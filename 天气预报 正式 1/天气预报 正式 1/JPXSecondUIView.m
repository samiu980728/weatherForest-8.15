//
//  JPXSecondUIView.m
//  天气预报 正式 1
//
//  Created by 萨缪 on 2018/8/14.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "JPXSecondUIView.h"

@implementation JPXSecondUIView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self ){
        _tableView = [[UITableView alloc] init];
        
        _tableView.delegate  = self;
        _tableView.dataSource = self;
        
        [self addSubview:_tableView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
}

//- (void)createView
//{
//    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 736) style:UITableViewStyleGrouped];
//
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//
//    [self addSubview:_tableView];
//
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell1 = nil;
    UITableViewCell * cell2 = nil;
    UITableViewCell * cell3 = nil;
    UITableViewCell * cell4 = nil;
    UITableViewCell * cell5 = nil;
    
    if ( indexPath.row == 0 ){
        cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if ( cell1 == nil ){
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        UILabel * label1 = [[UILabel alloc] init];
        //label1.frame = CGRectMake(40, 30, <#CGFloat width#>, <#CGFloat height#>)
        cell1.backgroundColor = [UIColor blueColor];
        return cell1;
    }
    if ( indexPath.row > 0 ){
        cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if ( cell2 == nil ){
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        cell2.backgroundColor = [UIColor yellowColor];
    }
    return cell2;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.row == 0 ){
        return 200;
    }
    else if ( indexPath.row == 1 ){
        return 70;
    }
    else if ( indexPath.row == 2 ){
        return 190;
    }
    return 60;
}


@end
