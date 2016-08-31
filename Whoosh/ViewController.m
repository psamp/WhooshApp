//
//  ViewController.m
//  Whoosh
//
//  Created by Princess Sampson on 8/30/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property(strong, nonatomic) NSMutableArray *sentences;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *labelsTopConstraint;
@property (strong, nonatomic) IBOutlet UILabel *topLabel;
@property (strong, nonatomic) IBOutlet UILabel *bottomLabel;
@property (strong, nonatomic) IBOutlet UITextField *textField;
- (IBAction)store:(UIButton *)sender;
- (void)addSentence:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sentences = [NSMutableArray array];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    BOOL shouldReturn = NO;
    
    if (textField.text.length != 0) {
        shouldReturn = YES;
    }
    
    return shouldReturn;
}

- (IBAction)store:(UIButton *)sender {
        [self addSentence:sender];
}

-(void)addSentence:(UIButton *)sender {
    NSString *text = self.textField.text;
    
    NSLog(@"%@", @(self.sentences.count));
    
    if(self.sentences.count == 0) {
        [self.sentences insertObject:text atIndex:0];
        self.topLabel.text = [self.sentences objectAtIndex:0];
        
    } else if(self.sentences.count == 1) {
        [self.sentences insertObject:text atIndex:1];
        self.bottomLabel.text = [self.sentences objectAtIndex:1];
    }
    
    if(![[self.sentences  objectAtIndex: 0] isEqual:nil] || self.sentences.count == 1) {
        [sender setTitle:[NSString stringWithFormat:@"stored: %@", @(self.sentences.count)]
                forState:UIControlStateNormal];
    }
}
@end
