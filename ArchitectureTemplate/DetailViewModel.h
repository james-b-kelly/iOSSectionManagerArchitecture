//
//  DetailViewModel.h
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ViewModel.h"

@interface DetailViewModel : ViewModel

/**
 *  Detail view model for displaying a single item.  Note that 
 *  the Item object itself is not exposed at all, just it's properties.
 */

- (instancetype)initWithItem:(NSDictionary *)item;

@property (nonatomic, copy, readonly) NSString *itemTitle;
@property (nonatomic, copy, readonly) NSString *itemDescription;

@end
