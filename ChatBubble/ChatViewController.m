//
//  ChatViewController.m
//  ChatBubble
//
//  Created by Daniel.Burke on 4/18/14.
//  Copyright (c) 2014 D2. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatBubbleCell.h"

@interface ChatViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ChatViewController{
    UITableView *chatTable;
    NSArray *chatImages;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    chatImages = [[NSArray alloc] initWithObjects:
                  @"ferry.jpg",
                  @"obama.jpg",
                  @"goodnight.png",
                  @"harlem.jpg",
                  @"crimea.jpg",
                  @"fallon.jpg",
                  @"flight.jpg",
                  @"healthcaregov.jpg",
                  @"mvp.jpg",
                  @"pistorius.jpg",
                  @"snowden.jpg",
                  nil];
    
    chatTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    chatTable.delegate = self;
    chatTable.dataSource = self;
    chatTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    chatTable.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    [self.view addSubview:chatTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView Delegate Methods

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerSpacer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 7)];
    footerSpacer.backgroundColor = [UIColor clearColor];
    return footerSpacer;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return [chatImages count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  120;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [chatImages count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    ChatBubbleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[ChatBubbleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(indexPath.row != 2){
        cell.chatImageView.image = [UIImage imageNamed:[chatImages objectAtIndex:indexPath.row]];
    }
    
    cell.bubbleWidth = 120; //Max width to be set is 310 because of a 5pt gutter on each side
    cell.textBubble.text = @"This is some text in a chat bubble";
    
    return cell;
}

@end
