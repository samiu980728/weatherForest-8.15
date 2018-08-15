//
//  JPXFirstUIView.m
//  天气预报 正式 1
//
//  Created by 萨缪 on 2018/8/14.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "JPXFirstUIView.h"

@implementation JPXFirstUIView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//传值 通过协议传值先传值 城市名称 然后再根据城市名称调出对应的网络接口
//然后在对应的cell中显示从接口中获取的数据 显示到屏幕上
//用到的接口：3到10天天气预报  日出日落 空气质量实况

- (instancetype)initWithFrame:(CGRect)frame andcityString:(NSString *)ciString
{
    
    self = [super initWithFrame:frame];
    //在这里用协议传值试试
    
    
    if ( self ){
        
        //初始化
        _fCNameStr = [[NSString alloc] init];
        
        pushTimearray = [[NSMutableArray alloc] init];
        
        pushNameArray = [[NSMutableArray alloc] init];
        
        pushTempArray = [[NSMutableArray alloc] init];
        
        cond_txtArray = [[NSMutableArray alloc] init];
        
        tmpMaxArray = [[NSMutableArray alloc] init];
        
        tmpMinArray = [[NSMutableArray alloc] init];
        
        tmpMaxArray1 = [[NSMutableArray alloc] init];
        
        tmpMinArray1 = [[NSMutableArray alloc] init];
        
        tmpMaxArray2 = [[NSMutableArray alloc] init];
        
        tmpMinArray2 = [[NSMutableArray alloc] init];
        
        weatherStatesArray = [[NSMutableArray alloc] init];
        
        weatherStatesArray1 = [[NSMutableArray alloc] init];
        
        weatherStatesArray2 = [[NSMutableArray alloc] init];
        
        _fCNameStr = ciString;
        //NSLog(@"_fCNameStr8888888 = %@",_fCNameStr);
        
        //NSLog(@"这里本身的 ciString = %@",ciString);
        //属性传值已经得到了城市 那么就开始准备网络请求吧

        [self getInternetMsg];
        
        _tableView = [[UITableView alloc] init];
        
        _tableView.delegate  = self;
        _tableView.dataSource = self;
        
        [self addSubview:_tableView];
        
        
        
    }
    return self;
}

- (void)getInternetMsg
{
    if ( [_fCNameStr isEqualToString:@"beijing"] ){
//        dispatch_sync(dispatch_get_main_queue(), ^{
        [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://free-api.heweather.com/s6/weather?location=beijing&key=70c5ee7d3a214fefaee2fc9ca8eeb52f"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            dispatch_sync(dispatch_get_main_queue(), ^{
            
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            NSInteger flag = 0;
            for (NSInteger i = 0; i < [pushNameArray count]; i++ ) {
                if ( [dict[@"HeWeather6"][0][@"basic"][@"parent_city"] isEqualToString:[NSString stringWithFormat:@"%@",[pushNameArray objectAtIndex:i]]] ){
                    flag = 1;
                    break;
                }
            }
            
            if ( flag == 0 ){
                [pushNameArray addObject:dict[@"HeWeather6"][0][@"basic"][@"parent_city"]];
                
                [pushTimearray addObject:dict[@"HeWeather6"][0][@"update"][@"loc"]];
                
                [pushTempArray addObject:dict[@"HeWeather6"][0][@"now"][@"tmp"]];
                
                [cond_txtArray addObject:dict[@"HeWeather6"][0][@"now"][@"cond_txt"]];
                
                
                [tmpMaxArray addObject:dict[@"HeWeather6"][0][@"daily_forecast"][0][@"tmp_max"]];
                
                [tmpMinArray addObject:dict[@"HeWeather6"][0][@"daily_forecast"][0][@"tmp_min"]];
                
                [tmpMaxArray1 addObject:dict[@"HeWeather6"][0][@"daily_forecast"][1][@"tmp_max"]];
                
                [tmpMinArray1 addObject:dict[@"HeWeather6"][0][@"daily_forecast"][1][@"tmp_min"]];
                
                [tmpMaxArray2 addObject:dict[@"HeWeather6"][0][@"daily_forecast"][2][@"tmp_max"]];
                
                [tmpMinArray2 addObject:dict[@"HeWeather6"][0][@"daily_forecast"][2][@"tmp_min"]];
                
                [weatherStatesArray addObject:dict[@"HeWeather6"][0][@"daily_forecast"][0][@"cond_code_d"]];
                
                [weatherStatesArray1 addObject:dict[@"HeWeather6"][0][@"daily_forecast"][1][@"cond_code_d"]];
                
                [weatherStatesArray2 addObject:dict[@"HeWeather6"][0][@"daily_forecast"][2][@"cond_code_d"]];
                
                NSLog(@"进去了----");
            }
            // NSLog(@"dict = %@",dict);
//            NSLog(@"pushNameArray = %@",pushNameArray);
//
//            NSLog(@"pushTimearray = %@",pushTimearray);
//
//            NSLog(@"cond_txtArray = %@",cond_txtArray);
                
                //NSLog(@"get里的 tmpMaxArray = %@",tmpMaxArray);
                
                NSLog(@"get里的  weatherStatesArray = %@",weatherStatesArray);
            
            //加到主线程 更新_tableView
//            dispatch_sync(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
            
        }] resume];
            //});
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
}


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
        if ( [pushNameArray isKindOfClass:[NSArray class]] && pushNameArray.count > 0){
        UILabel * label1 = [[UILabel alloc] init];
            label1.font = [UIFont systemFontOfSize:35];
        label1.frame = CGRectMake(150, 30, 200, 40);
        
        label1.textColor = [UIColor whiteColor];
       // NSLog(@"tabnleView中**********pushNameArray = %@",pushNameArray);
        //NSLog(@"[pushNameArray count] = %li",[pushNameArray count]);
        label1.text = [pushNameArray objectAtIndex:indexPath.row];
        [cell1.contentView addSubview:label1];
            
            UILabel * label2 = [[UILabel alloc] init];
            label2.text = [pushTempArray objectAtIndex:indexPath.row];
            label2.textColor = [UIColor whiteColor];
            label2.frame = CGRectMake(155, 120, 200, 50);
            label2.font = [UIFont systemFontOfSize:50];
            [cell1.contentView addSubview:label2];
            
            UILabel * label3 = [[UILabel alloc] init];
            label3.text = [cond_txtArray objectAtIndex:indexPath.row];
            label3.frame = CGRectMake(150, 75, 200, 40);
            label3.textColor = [UIColor whiteColor];
            label3.font = [UIFont systemFontOfSize:30];
            [cell1.contentView addSubview:label3];
            
        }
        cell1.backgroundColor = [UIColor blackColor];
        return cell1;
    }
    else if ( indexPath.row == 1 ){
        cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if ( cell2 == nil ){
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
            UIScrollView * middleScrollView = [[UIScrollView alloc] init];
            middleScrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
            middleScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, 100);
            //middleScrollView.backgroundColor = [UIColor blueColor];
            
            [cell2.contentView addSubview:middleScrollView];
        }
        cell2.backgroundColor = [UIColor blueColor];
        return cell2;
    }
    else if ( indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 ){
        cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
        if ( cell3 == nil ){
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
        if ( [tmpMaxArray isKindOfClass:[NSArray class]] && tmpMaxArray.count > 0 ){
            if ( indexPath.row == 2 ){
            UILabel * label1 = [[UILabel alloc] init];
            label1.font = [UIFont systemFontOfSize:20];
            label1.frame = CGRectMake(270, 0, 50, 30);
            label1.textColor = [UIColor whiteColor];
            label1.text = [tmpMaxArray objectAtIndex:0];
            
            //NSLog(@"TableVie里的 tmpMaxArray = %@",tmpMaxArray);
            [cell3.contentView addSubview:label1];
            
            UILabel * label2 = [[UILabel alloc] init];
            label2.font = [UIFont systemFontOfSize:20];
            label2.text = [tmpMinArray objectAtIndex:0];
            label2.textColor = [UIColor whiteColor];
            label2.frame = CGRectMake(330, 0, 50, 30);
            label2.textColor = [UIColor grayColor];
            [cell3.contentView addSubview:label2];
                
                UIImageView * imageView = [[UIImageView alloc] init];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",weatherStatesArray[0]]];
                imageView.frame = CGRectMake(200, 0, 30, 30);
                
                
                //还有问题 照片没传上去！！！！！！！！
                
                NSLog(@"NSString stringWithFormat = %@",[NSString stringWithFormat:@"%@.png",weatherStatesArray[0]]);
                
                [cell3.contentView addSubview:imageView];
            }
            else if ( indexPath.row == 3 ){
                UILabel * label1 = [[UILabel alloc] init];
                label1.font = [UIFont systemFontOfSize:20];
                label1.frame = CGRectMake(270, 0, 50, 30);
                label1.textColor = [UIColor whiteColor];
                label1.text = [tmpMaxArray1 objectAtIndex:0];
                
                //NSLog(@"TableVie里的 tmpMaxArray = %@",tmpMaxArray);
                [cell3.contentView addSubview:label1];
                
                UILabel * label2 = [[UILabel alloc] init];
                label2.font = [UIFont systemFontOfSize:20];
                label2.text = [tmpMinArray1 objectAtIndex:0];
                label2.textColor = [UIColor whiteColor];
                label2.frame = CGRectMake(330, 0, 50, 30);
                label2.textColor = [UIColor grayColor];
                [cell3.contentView addSubview:label2];
                
                UIImageView * imageView = [[UIImageView alloc] init];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",weatherStatesArray1[0]]];
                imageView.frame = CGRectMake(200, 0, 30, 30);
                [cell3.contentView addSubview:imageView];
            }
            else if ( indexPath.row == 4 ){
                UILabel * label1 = [[UILabel alloc] init];
                label1.font = [UIFont systemFontOfSize:20];
                label1.frame = CGRectMake(270, 0, 50, 30);
                label1.textColor = [UIColor whiteColor];
                label1.text = [tmpMaxArray2 objectAtIndex:0];
                
                //NSLog(@"TableVie里的 tmpMaxArray = %@",tmpMaxArray);
                [cell3.contentView addSubview:label1];
                
                UILabel * label2 = [[UILabel alloc] init];
                label2.font = [UIFont systemFontOfSize:20];
                label2.text = [tmpMinArray2 objectAtIndex:0];
                label2.textColor = [UIColor whiteColor];
                label2.frame = CGRectMake(330, 0, 50, 30);
                label2.textColor = [UIColor grayColor];
                [cell3.contentView addSubview:label2];
                
                UIImageView * imageView = [[UIImageView alloc] init];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",weatherStatesArray2[0]]];
                imageView.frame = CGRectMake(200, 0, 30, 30);
                [cell3.contentView addSubview:imageView];
            }
        }
            cell3.backgroundColor = [UIColor whiteColor];
    }
        return cell3;
    }
    if ( indexPath.row > 4 ){
        cell4 = [_tableView dequeueReusableCellWithIdentifier:@"cell4"];
        if ( cell4 == nil ){
            cell4 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell4"];
        }
        
        cell4.backgroundColor = [UIColor blackColor];
        
    }
    return cell4;
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
        return 100;
    }
//    else if ( indexPath.row == 2 ){
//        return 190;
//    }
    else if ( indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 ){
        return 30;
    }
    return 60;
}


@end
