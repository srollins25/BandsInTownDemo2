//
//  AppDelegate.h
//  BandsInTownDemo2
//
//  Created by stephan rollins on 10/21/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

