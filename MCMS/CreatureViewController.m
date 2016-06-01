//
//  CreatureViewController.m
//  MCMS
//
//  Created by Mohamed Ayadi on 6/1/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    


    
    NSLog(@"%@",self.creature.name);
    self.label.text = self.creature.name;
 
    
}





- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {
    
    if([sender.title isEqualToString:@"Edit"])
    {
        sender.title = @"Done";
        self.textFieldName.hidden = NO;
        self.textFieldName.text = self.creature.name;
        [self.textFieldName resignFirstResponder];
        
        

    }else{
        
        
        sender.title = @"Edit";
        self.creature.name = self.textFieldName.text;
        self.label.text = self.textFieldName.text;
        self.textFieldName.hidden = YES;

        [self.textFieldName resignFirstResponder];
        
        
        
        
    }
    
    
    
    
}

@end
