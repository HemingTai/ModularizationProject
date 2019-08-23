//
//  HTScheduler+ModuleB.m
//  ModuleBCategory
//
//  Created by Hem1ng on 2019/8/20.
//  Copyright © 2019 Hem1ngT4i. All rights reserved.
//

#import "HTScheduler+ModuleB.h"

@implementation HTScheduler (ModuleB)

- (UIViewController *)ModuleB_viewControllerWithCallback:(void(^)(NSString *result))callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"callback"] = callback;
    return [self performTarget:@"ModuleB" action:@"viewController" params:params shouldCacheTarget:NO];
}

@end
