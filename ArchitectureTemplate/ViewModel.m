//
//  ViewModel.m
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (void)loadData {
    //Override in subclasses.
}

- (void)notifyDelegateViewModelDidUpdate {
    if ([self.delegate respondsToSelector:@selector(viewModelDidUpdateData:)]) {
        [self.delegate viewModelDidUpdateData:self];
    }
}

@end
