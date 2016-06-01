//
//  MagicalCreatures.m
//  MCMS
//
//  Created by Mohamed Ayadi on 6/1/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "MagicalCreatures.h"

@implementation MagicalCreatures

-(instancetype)initWithName:(NSString *)name andDescription:(NSString *)creatureDescription andAccessories:(NSMutableArray * _Nonnull)creatureAccessories{
    
    self = [super init];
   if(self){
        
       self.name = name;
       self.creatureDescription = creatureDescription;
       self.creatureImageName = @"dice.png";
       self.creatureAccessories = creatureAccessories;

    }
    
    
    return self;
    
}



@end
