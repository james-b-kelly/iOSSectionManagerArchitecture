//
//  DetailViewModel.h
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ViewModel.h"

@interface DetailViewModel : ViewModel

- (instancetype)initWithItem:(NSDictionary *)item;

@property (nonatomic, copy, readonly) NSString *itemName;
@property (nonatomic, copy, readonly) NSString *itemDescription;

@end
