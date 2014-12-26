//
//  ViewModel.h
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  View Model
 *  This is the base class from which you'll subclass all your View Models.
 *  The responsibility of the View Model is to expose data to your view (which is your view controller, or
 *  section managers).  View Models will know about your object models, but your view controllers and section
 *  managers will not (with the exception of building a new view model for another view controller).
 *  So if you ever change your object model implementation, you will only have to worry about your data providers
 *  and your View Models.
 *
 *  Depending on how carefully you write your view models, they should be reusable rather than being tied to one
 *  view controller.  Consider writing your view models as small as possible.
 *  So your view controller would have one 'big' view model which has references to multiple small view models.
 *  Suppose your view controller has a Product detail section and a Shop detail section.  You might want to have one view model
 *  corrosponding to each of those sections and reference them from your VC through its main view model.  
 *  
 *  label.text = self.viewModel.shopViewModel.shopName.
 *  
 *  That way, you can reuse the shop view model on another view controller.
 */


@class ViewModel;
@protocol ViewModelBaseDelegate <NSObject>

/**
 *  Your view controller will respond to this delegate method and reload its UI.
 *  For a more granular approach (you want to reload just one part of the UI), you can extend this 
 *  protocol in your subclass and require other methods (like viewModelDidUpdateSecondaryItems or something).
 */
- (void)viewModelDidUpdateData:(ViewModel *)viewModel;

@end


@interface ViewModel : NSObject

@property (nonatomic, weak) id<ViewModelBaseDelegate>delegate;

/*  It's possible that your view models could get quite large, so feel free to split out logical chunks
 *  of processing into sub/child view models.
 *  @property (nonatomic, strong) SomeChildViewModel *childViewModel;
 *  Your view controllers/section managers would then call self.viewModel.childViewModel.someProperty.
 *  These sub view models can also be reused by other parts of the app.
 */

/**
 *  Override in your subclass and perform and refreshing/loading on the appropriate data provider.
 */
- (void)loadData;

/**
 *  A convenience method to call in your subclass instead of wrapping your
 *  calls to viewModelDidUpateData with a check for responding to that selector each time.
 */
- (void)notifyDelegateViewModelDidUpdate;


@end
