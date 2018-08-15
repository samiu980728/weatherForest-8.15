//
//  searchViewController.h
//  天气预报 正式 1
//
//  Created by 萨缪 on 2018/8/13.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol giveCityNameControllerDelegate <NSObject>

- (void)giveCityName:(NSString *)nameOfCityStr;

@end

@interface searchViewController : UIViewController

@property (nonatomic, weak) id <giveCityNameControllerDelegate> delegate;

@property (nonatomic, strong) UITextField * textField;

@end
