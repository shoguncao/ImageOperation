#import "ImageOperation.h"
#import <ImageIO/ImageIO.h>
#import <CoreGraphics/CoreGraphics.h>

ImageOperation::ImageOperation(NSImage *img) {
    CGImageSourceRef source;

    source = CGImageSourceCreateWithData((CFDataRef)[img TIFFRepresentation], NULL);
    CGImageRef imageRef =  CGImageSourceCreateImageAtIndex(source, 0, NULL);
    
    //1、获取图片宽高
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    //2、创建颜色空间
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    //3、根据像素点个数创建一个所需要的空间
    UInt32 *imagePiexl = (UInt32 *)calloc(width*height, sizeof(UInt32));
    CGContextRef contextRef = CGBitmapContextCreate(imagePiexl, width, height, 8, 4*width, colorSpaceRef, kCGImageAlphaNoneSkipLast);
    //4、根据图片数据源绘制上下文
    CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), imageRef);
    //5、将彩色图片像素点重新设置颜色
    //取平均值 R=G=B=(R+G+B)/3
    for (int y=0; y<height; y++) {
        for (int x=0; x<width; x++) {
            //操作像素点
            uint8_t *rgbPiexl = (uint8_t *)&imagePiexl[y*width+x];
            //该色值下不做处理
            if (rgbPiexl[0] + rgbPiexl[1] + rgbPiexl[2] > 255.0*3*0.9) {
                rgbPiexl[0] = 255;
                rgbPiexl[1] = 255;
                rgbPiexl[2] = 255;
            }
        }
    }
    //根据上下文绘制
    CGImageRef finalRef = CGBitmapContextCreateImage(contextRef);
    
    this->m_changedImg = [[NSImage alloc] initWithCGImage:finalRef size:CGSizeMake(width, height)];
    
    //释放用过的内存
    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpaceRef);
    free(imagePiexl);
}
