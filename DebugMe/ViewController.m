//
//  ViewController.m
//  DebugMe
//
//  Created by xcode on 10/24/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


  @property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
  @property (weak, nonatomic) IBOutlet UITextField *textField;
  @property (weak, nonatomic) IBOutlet UIButton *printButton;

  @property NSMutableArray *array;
  @property NSMutableArray *arrayOfLabels;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self setup];

}

-(void)setup
{

    self.array = [NSMutableArray new];
    self.arrayOfLabels = [NSMutableArray new];

}


#pragma mark BUTTONS

- (IBAction)onButtonAddPressed:(id)sender {


    [self addTaskToList:self.textField.text];
    self.textField.text = @"";

}

- (IBAction)onButtonPrintPressed:(id)sender {


    NSString *results = [self buildDisplayString];
    [self displayResults:results];


}

- (IBAction)onButtonLabelPressed:(id)sender {


    [self createLabelsDisplay];

}


#pragma mark PREPARE RESULTS

-(void)addTaskToList:(NSString *)nwString  // note: beware of reserved words (new, operation, etc.)
{

    [self.array addObject:nwString];

}

-(NSString *)buildDisplayString
{

    NSString *displayString = @"";

    for(NSString *str in self.array){

        displayString = [NSString stringWithFormat:@"%@  %@", displayString, str];
    }

    return displayString;

}


-(void)displayResults:(NSString *)messageBody
{

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Our Input" message:messageBody preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {

        // do nothing
    }];

    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];

}


#pragma mark CREATE LABELS

-(void)createLabelsDisplay  // using fast enumeration would be cool, too
{

    int index = 0;

    for(int i = 0; i == [self.arrayOfLabels count]; i++)
    {

        [self createNextLabelWithText:[self.array objectAtIndex:i]
                          indexNumber:index];

    }
    
}

-(void)createNextLabelWithText:(NSString *)textForLabel indexNumber:(int)index
{

    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor grayColor];
    label.text = textForLabel;
    label.tag = index;          // use if need to find it (don't really like approach)

    [self.view addSubview:label];

}


@end




























/*
 
 float xPosition = 100.0;
 float yPosition = index * 100.0 + 150;
 float width = 300;
 float height = 80;

*/
