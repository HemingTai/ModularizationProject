//
//  HTScheduler+ModuleA.m
//  ModuleACategory
//
//  Created by Hem1ng on 2019/8/20.
//  Copyright © 2019 Hem1ngT4i. All rights reserved.
//

#import "HTScheduler+ModuleA.h"

@implementation HTScheduler (ModuleA)

- (UIViewController *)ModuleA_viewControllerWithParam:(NSDictionary *)param {
    NSLog(@"ModuleA param is %@", param);
    return [self performTarget:@"ModuleA" action:@"clickAction" params:param shouldCacheTarget:NO];
}

@end
