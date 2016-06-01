//
//  ViewController.m
//  MCMS
//
//  Created by Mohamed Ayadi on 6/1/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *creatures;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatures =@[@"one",@"two", @"three"].mutableCopy;
    
    

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
        
        
        
        [self.creatures addObject:textField1.text];
        [self.tableView reloadData];
        
    }];
    [alertContoller addAction:cancelAction];
    [alertContoller addAction:saveAction];
    
    [self presentViewController:alertContoller animated:true completion:nil];

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = self.creatures[indexPath.row];
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.creatures.count;
    
}


@end