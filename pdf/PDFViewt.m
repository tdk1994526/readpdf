//
//  PDFViewt.m
//  pdf
//
//  Created by 田东凯 on 16/6/16.
//  Copyright © 2016年 TDK. All rights reserved.
//

#import "PDFViewt.h"

@implementation PDFViewt
@synthesize filePath,pageNumber;

- (void)drawRect:(CGRect)rect //只要是UIView都有的绘图函数，基础哟～
{
    if(filePath == nil) //如果没被初始化的话，就初始化
    {
        pageNumber = 10;   //这个其实应该由外部函数控制，不过谁让这个程序特别简单呢
        filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];
        //这里，文件在这里！
        pdfDocument = [self MyGetPDFDocumentRef]; //从自定义getter得到文件索引
    }
    
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    //这个我研究了一段时间呢，不过就照打就可以了
    
    page = CGPDFDocumentGetPage(pdfDocument, pageNumber);
    //便捷函数，告诉人家文档，告诉人家页码，就给你页面索引
    
    CGContextDrawPDFPage(myContext, page);
    //画！
}

//此getter可以考虑照打... 都是CF函数，我看到就恶心。
//其实不是很难了，得到文件，转换成URL，然后通过
//CGPDFDocumentCreateWithURL(url)得到文件内容索引
//Ta Daaa~~
- (CGPDFDocumentRef)MyGetPDFDocumentRef
{
    CFStringRef path;
    CFURLRef url;
    CGPDFDocumentRef document;
    path = CFStringCreateWithCString(NULL, [filePath UTF8String], kCFStringEncodingUTF8);
    url = CFURLCreateWithFileSystemPath(NULL, path, kCFURLPOSIXPathStyle, 0);
    CFRelease(path);
    document = CGPDFDocumentCreateWithURL(url);
    CFRelease(url);
    return document;
}

-(void)reloadView
{
    [self setNeedsDisplay]; //每次需要重画视图了，就call这个
}

-(void)goUpPage
{
    pageNumber++;
    
    [self reloadView];
}
-(void)goDownPage
{
    pageNumber--;
    [self reloadView];   
}   
@end
