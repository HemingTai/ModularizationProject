//
//  Target_ModuleB.m
//  ModuleB
//
//  Created by Hem1ng on 2019/8/20.
//  Copyright © 2019 Hem1ngT4i. All rights reserved.
//

#import "Target_ModuleB.h"
#import "HTBViewController.h"

@implementation Target_ModuleB

- (UIViewController *)Action_viewController:(NSDictionary *)params {
    NSLog(@"ModuleB param is %@",params);
    return [[HTBViewController alloc] init];
}

@end
