//
//  ViewController.m
//  pdf
//
//  Created by 田东凯 on 16/6/16.
//  Copyright © 2016年 TDK. All rights reserved.
//

#import "ViewController.h"
#import "PdfView.h"
#import "PDFViewt.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)dddd:(UIButton *)sender {
    [self.pdfView down];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = CGRectMake(0, 0, 320, 500);
    //1136 × 640
    self.pdfView = [[PdfView alloc] initWithFrame:frame];
    self.pdfView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.pdfView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
