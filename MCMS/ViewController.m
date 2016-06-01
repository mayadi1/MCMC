//
//  ViewController.m
//  MCMS
//
//  Created by Mohamed Ayadi on 6/1/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreatures.h"
#import "CreatureViewController.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *creatures;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MagicalCreatures *creatures1 = [[MagicalCreatures alloc]initWithName:@"one"];
    
    MagicalCreatures *creatures2 = [[MagicalCreatures alloc]initWithName:@"three"];

    MagicalCreatures *creatures3 = [[MagicalCreatures alloc]initWithName:@"two"];
    
    self.creatures = @[creatures1,creatures2,creatures3].mutableCopy;
    
    
    
    
    

}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
    
}


- (IBAction)add:(UIBarButtonItem *)sender {
    UIAlertController *alertContoller = [UIAlertController alertControllerWithTitle:@"Enter text" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertContoller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Text";
    }];
    
    
    UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *saveAction =[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        UITextField *textField1 = alertContoller.textFields.firstObject;
        //UITextField *textField2 = alertContoller.textFields.lastObject;
        
        
        MagicalCreatures *creature = [[MagicalCreatures alloc]initWithName:textField1.text];
        
        
        [self.creatures addObject:creature];
        [self.tableView reloadData];
        
    }];
    [alertContoller addAction:cancelAction];
    [alertContoller addAction:saveAction];
    
    [self presentViewController:alertContoller animated:true completion:nil];

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    MagicalCreatures *creature = self.creatures[indexPath.row];
    
    
    cell.textLabel.text = creature.name;
    
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.creatures.count;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CreatureViewController *dvc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    dvc.creature = self.creatures[indexPath.row];
    
    
    
    
}


@end