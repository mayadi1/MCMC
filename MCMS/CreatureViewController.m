//
//  CreatureViewController.m
//  MCMS
//
//  Created by Mohamed Ayadi on 6/1/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextView *textViewCreatureDescription;
@property (weak, nonatomic) IBOutlet UITableView *tableViewCreatureAccessoires;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewCreature;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    


    
    NSLog(@"%@",self.creature.name);
    self.label.text = self.creature.name;
    self.textViewCreatureDescription.text = self.creature.creatureDescription;
    self.imageViewCreature.image = [UIImage imageNamed:@"jerry"];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.creature.creatureAccessories[indexPath.row];
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.creature.creatureAccessories.count;

}



- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {
    
    if([sender.title isEqualToString:@"Edit"])
    {
        sender.title = @"Done";
        self.textFieldName.hidden = NO;
        self.textFieldName.text = self.creature.name;
        
        self.textViewCreatureDescription.text = self.creature.creatureDescription;
        
        [self.textFieldName resignFirstResponder];
        
        

    }else{
        
        
        sender.title = @"Edit";
        self.creature.name = self.textFieldName.text;
        
        self.label.text = self.textFieldName.text;
        self.creature.creatureDescription = self.textViewCreatureDescription.text;
        
        self.textFieldName.hidden = YES;

        [self.textFieldName resignFirstResponder];
        
        
        
        
    }
    
    
    
    
}

@end
