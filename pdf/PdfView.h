//
//  PdfView.h
//  pdf
//
//  Created by 田东凯 on 16/6/16.
//  Copyright © 2016年 TDK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PdfView : UIView {
    CGPDFDocumentRef pdf;
}

-(void)drawInContext:(CGContextRef)context;
-(void)down;
@end
