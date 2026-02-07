#import <iostream>

#import "BPMDetect.h"
#import "BPMDetectC.h"
#import "STTypes.h"

@implementation BPMDetectC {
    soundtouch::BPMDetect *_bpmDetect;
}

- (id)initWithSampleRate:(int)sampleRate
        numberOfChannels:(int)numberOfChannels {
    self = [super init];

    if (self) {
        _bpmDetect = new soundtouch::BPMDetect(numberOfChannels, sampleRate);
    }

    return self;
}

- (void)process:(const float *)data numberOfSamples:(int)numberOfSamples {
    _bpmDetect->inputSamples(data, numberOfSamples);
}

- (float)getBpm {
    float value = _bpmDetect->getBpm();

    if (value < 60) {
        value *= 2;
    }

    return value;
}

- (void)dealloc {
    std::cout << "dealloc BPMDetectC.mm" << std::endl;

    if (_bpmDetect) {
        delete _bpmDetect;
        _bpmDetect = nullptr;
    }
}

@end
