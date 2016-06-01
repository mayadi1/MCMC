//
//  MagicalCreatures.h
//  MCMS
//
//  Created by Mohamed Ayadi on 6/1/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreatures : NSObject

@property NSString *name;
@property NSString *creatureDescription;
@property NSString *creatureImageName;
@property NSMutableArray *creatureAccessories;

-(instancetype)initWithName:(NSString *)name andDescription:(NSString *)creatureDescription andAccessories:(NSMutableArray *)creatureAccessories;

@end
