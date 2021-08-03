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
        for (int i = 1; i <= 10; i ++) {
            NSImage *img = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"/Users/shoguncao/Desktop/oldimg/%d.png", i]];
            ImageOperation *imgOp = new ImageOperation(img);
            
            NSData *imageData = [imgOp->m_changedImg TIFFRepresentation];
            NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithData:imageData];
            NSDictionary *imageProps = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:1.0] forKey:NSImageCompressionFactor];
            imageData = [imageRep representationUsingType:NSBitmapImageFileTypePNG properties:imageProps];
            [imageData writeToFile:[NSString stringWithFormat:@"/Users/shoguncao/Desktop/newimg/cccc%d.png", i] atomically:NO];
        }
    }
    return 0;
}
