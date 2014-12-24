//
//  CoreDataManager.h
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


/**
 *  Just moved the CoreData stack out of AppDelegate (where Xcode puts it by default) into
 *  its own class.  Note that CoreData is not actually used in this example project.
 */

@interface CoreDataManager : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;
@end
