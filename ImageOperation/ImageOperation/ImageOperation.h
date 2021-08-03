#pragma once

#import <AppKit/AppKit.h>

class ImageOperation {
public:
    NSImage *m_changedImg;
    ImageOperation(NSImage *img);
};
