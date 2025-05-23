#pragma once

#import <AppKit/AppKit.h>

class ImageOperation {
public:
    ImageOperation();
    
    /// 将RGB均值高于某个值的像素全部调整为指定数值
    /// @param img 图片
    /// @param highestPixel 高于此值的像素全部转换到defaultPixel值
    NSImage *removeHighPixel(NSImage *img, uint8_t highestPixel, uint8_t defaultPixel=255, uint8_t alpha=255);
    
    /// 保存图片到指定文件路径
    /// @param img 图片
    /// @param filePath 文件路径
    void saveImage(NSImage *img, NSString *filePath);
};
