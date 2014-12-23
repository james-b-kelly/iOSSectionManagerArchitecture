//
//  ViewModelBase.h
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ViewModelBase;
@protocol ViewModelBaseDelegate <NSObject>

- (ViewModelBase *)viewModelDidUpdateData;

@end

@interface ViewModelBase : NSObject

- (void)loadData;

@end
