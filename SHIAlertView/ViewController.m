//
//  ViewController.m
//  SHIAlertView
//
//  Created by tomyKeisuke on 2015/10/31.
//  Copyright (c) 2015年 tomyKeisuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic)NSArray* cellarray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView* table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    _cellarray = [NSArray array];
    
    _cellarray = ViewController.cellArray;
    NSLog(@"%@",_cellarray);
}

+
(NSArray*)cellArray{
    return @[@"one button",@"two but button",@"three button",@"four button",@"five button"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellarray.count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellid = @"identifer";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = _cellarray[indexPath.row];
    
    NSLog(@"%@",_cellarray[indexPath.row]);
    
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            [[SHIAlertView sharedView]showTitle:@"Title" descreption:@"Descreption" buttonTitle:@"OK"];
            [SHIAlertView sharedView].tag = 2;
            break;
        
        case 1:
            [[SHIAlertView sharedView]showTitle:@"Title" descreption:@"Descreption" buttonTitle:@"OK" otherTitle:@"Two"];
            break;
        case 2:
            [[SHIAlertView sharedView]showTitleAnyButton:@"Title" descreption:@"Descreption" buttonTitle:@[@"OK",@"One",@"Two"]];
            break;
        case 3:
             [[SHIAlertView sharedView]showTitleAnyButton:@"Title" descreption:@"Descreption" buttonTitle:@[@"OK",@"One",@"Two",@"Three"]];
            break;
        case 4:
             [[SHIAlertView sharedView]showTitleAnyButton:@"Title" descreption:@"Descreption" buttonTitle:@[@"OK",@"One",@"Two",@"Three",@"Five"]];
            break;
        default:
            break;
    }
    [SHIAlertView sharedView].deleate = self;
    
}

-(void)shiAlertView:(SHIAlertView *)alert clickButtonIndex:(NSInteger)index{
    NSLog(@"SHI ->  %ld  cliclButton  -> %ld",alert.tag,index);
}

@end
