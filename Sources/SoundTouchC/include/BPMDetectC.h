
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPMDetectC : NSObject

- (id)init;

- (void)process:(const float *)data
     numberOfSamples:(int)numberOfSamples
    numberOfChannels:(int)numberOfChannels
     sampleRate:(int)sampleRate;

- (float)getBpm;

@end

NS_ASSUME_NONNULL_END
