//
//  ViewController.m
//  github2
//
//  Created by ayoub on 2016-04-01.
//  Copyright (c) 2016 com.Appcoda. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UAGithubEngine *engine = [[UAGithubEngine alloc] initWithUsername:@"ayoub00" password:@"ayoub01" withReachability:YES];
    
    [engine repositoriesWithSuccess:^(id response) {
        self.repo=(response);
        NSLog(@"Got an array of repos: %@", self.repo[0][@"name"]);
    } failure:^(NSError *error) {
        NSLog(@"Oops: %@", error);
    }];
    
    [engine user:@"this_guy" isCollaboratorForRepository:@"UAGithubEngine" success:^(BOOL collaborates) {
        NSLog(@"%d", collaborates);
    } failure:^(NSError *error){
        NSLog(@"D'oh: %@", error);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

}

@end
