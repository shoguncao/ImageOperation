#pragma once

#import <AppKit/AppKit.h>

class ImageOperation {
public:
    NSImage *m_changedImg;
    ImageOperation(NSImage *img);
    ImageOperation();
    
    NSImage *removeHighPixel(NSImage *img, uint8_t highestPixel, uint8_t defaultPixel=255);
    void saveImage(NSImage *img, NSString *filePath);
};
