//
//  PDFViewt.h
//  pdf
//
//  Created by 田东凯 on 16/6/16.
//  Copyright © 2016年 TDK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewt : UIScrollView {
    NSString *filePath;
    CGPDFDocumentRef pdfDocument;
    CGPDFPageRef page;
    int pageNumber;
}

@property (copy, nonatomic) NSString *filePath;
@property int pageNumber;

-(CGPDFDocumentRef)MyGetPDFDocumentRef;
-(void)reloadView;
-(void)goUpPage;
-(void)goDownPage;
@end
