//
//  main.m
//  ImageOperationDemo
//
//  Created by shoguncao on 2021/8/3.
//

#import <Foundation/Foundation.h>
#import <ImageOperation/ImageOperation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ImageOperation *imgOp = new ImageOperation();
        for (int i = 1; i <= 10; i ++) {
            NSImage *img = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"/Users/shoguncao/Desktop/img/%d.png", i]];
            NSImage *imgChanged = imgOp->removeHighPixel(img, 255*0.9, 255);
            imgOp->saveImage(imgChanged, [NSString stringWithFormat:@"/Users/shoguncao/Desktop/img/cccc%d.png", i]);
        }
        delete imgOp;
    }
    return 0;
}
