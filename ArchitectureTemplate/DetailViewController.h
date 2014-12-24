//
//  DetailViewController.h
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewModel.h"

@interface DetailViewController : UIViewController

- (instancetype)initWithViewModel:(DetailViewModel *)viewModel;

@end
