
#import "BPMDetect.h"
#import "STTypes.h"

#include "BPMDetectC.h"

@implementation BPMDetectC

soundtouch::BPMDetect *bpmDetect;

- (id)init {
    self = [super init];

    return self;
}

- (void)process:(const float *)data
     numberOfSamples:(int)numberOfSamples
    numberOfChannels:(int)numberOfChannels
          sampleRate:(int)sampleRate {
    if (bpmDetect == nullptr) {
        bpmDetect = new soundtouch::BPMDetect(numberOfChannels, sampleRate);
    }

    //
    bpmDetect->inputSamples(data, numberOfSamples);
}

- (float)getBpm {
    return bpmDetect->getBpm();
}

- (void)dealloc {
    if (bpmDetect) {
        delete bpmDetect;
        bpmDetect = nullptr;
    }
}

@end
