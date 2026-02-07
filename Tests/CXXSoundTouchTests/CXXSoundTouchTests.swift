import AVFoundation
import Testing

@testable import SoundTouchC

final class CXXSoundTouchTests {
    @Test func detect() async throws {
        let url = URL(fileURLWithPath: "/Users/rf/Downloads/TestResources/formats/tabla.wav")
        let audioFile = try AVAudioFile(forReading: url)
        let frameCapacity = AVAudioFrameCount(audioFile.length)
        
        guard let buffer = AVAudioPCMBuffer(
            pcmFormat: audioFile.processingFormat, frameCapacity: frameCapacity) else {
            Issue.record("failed to create buffer")
            return
        }
        
        try audioFile.read(into: buffer)

        let channelCount = Int32(audioFile.fileFormat.channelCount)

        let bpmDetect = BPMDetectC(
            numberOfChannels: channelCount,
            sampleRate: Int32(audioFile.fileFormat.sampleRate))

        guard let rawData = buffer.floatChannelData else { return }

//        for n in 0 ..< channelCount {
            bpmDetect.process(rawData[0], numberOfSamples: Int32(frameCapacity))
//        }

        let value = bpmDetect.getBpm()

        print(value, "bpm")
    }
}
