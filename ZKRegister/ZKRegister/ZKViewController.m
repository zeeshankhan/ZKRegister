//
//  ZKViewController.m
//  ZKRegister
//
//  Created by Zeeshan Khan on 13/11/12.
//  Copyright (c) 2012 Zeeshan Khan. All rights reserved.
//

#import "ZKViewController.h"
#import "ZKRegisterModel.h"

@interface ZKViewController ()
@property (nonatomic, strong) UITableView *tblRegister;
@property (nonatomic, strong) NSMutableArray *arrRows;
@property (nonatomic, strong) ZKRegisterModel *model;
@end

@implementation ZKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Register";
    
    NSArray *arr = [[NSArray alloc] initWithObjects:@"Zee",[NSNumber numberWithBool:YES], nil];
    [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@",obj);
    }];
    
    _tblRegister = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tblRegister.dataSource = self;
    _tblRegister.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [[self view] addSubview:_tblRegister];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (NSMutableArray*)arrRows {
    if (_arrRows == nil) {
        
        NSString *strFilePath = [[NSBundle mainBundle] pathForResource:@"TableRows" ofType:@"plist"];
        NSData *plistData = [NSData dataWithContentsOfFile:strFilePath];
        __weak NSError *error = nil;
        
        NSPropertyListFormat format = NSPropertyListBinaryFormat_v1_0;
        _arrRows = (NSMutableArray*)[NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
        
        if (error != nil) {
            _arrRows = nil;
            NSLog(@"Plist error while loading: %@",[error localizedDescription]);
        }
    }
    return _arrRows;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self arrRows] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSMutableDictionary *dicCell = [[self arrRows] objectAtIndex:indexPath.row];
    NSString *strIdentifier = [dicCell objectForKey:@"Cell"];
    _cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    if (_cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:strIdentifier owner:self options:nil];
    }
    [(id<ConfigureCustomCellDelegate>)_cell initializeCustomCellPropertiesWithCellDictionary:dicCell andObject:self];
    return _cell;
}

#pragma mark -

- (void)setCustomCellValue:(id)value forKey:(id)key {
    //NSLog(@"%@ - %@", value, key);
    if (_model == nil) {
        _model = [[ZKRegisterModel alloc] init];
    }
    
    NSError *error = nil;
    if ([[self model] validateValue:&value forKey:key
                                        error:&error]) {
        [[self model] setValue:value forKey:key];
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:error.localizedDescription delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView setTag:1001];
        [alertView show];
    }

}

@end
