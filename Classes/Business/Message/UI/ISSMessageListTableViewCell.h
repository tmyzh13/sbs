//
//  ISSMessageListTableViewCell.h
//  SmartBuildingSite
//
//  Created by XT Xiong on 2017/10/27.
//  Copyright © 2017年 iSoftStone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSMessageModel.h"

@interface ISSMessageListTableViewCell : UITableViewCell

- (void)conFigDataMessageModel:(ISSMessageModel *)messageModel;

@end
