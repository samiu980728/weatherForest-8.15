//
//  JPXSecondUIView.h
//  天气预报 正式 1
//
//  Created by 萨缪 on 2018/8/14.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPXSecondUIView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

{
    UITableView * _tableView;
}
@end
