import AVFoundation
import Testing

@testable import SoundTouchC

final class CXXSoundTouchTests {
    @Test func bpmDetect() async throws {
        let url = URL(fileURLWithPath: "/Users/rf/Downloads/TestResources/bpm/110_drumloop.wav")

        let audioFile = try AVAudioFile(forReading: url)
        let frameCapacity = AVAudioFrameCount(audioFile.length)

        guard let buffer = AVAudioPCMBuffer(
            pcmFormat: audioFile.processingFormat, frameCapacity: frameCapacity
        ) else {
            Issue.record("failed to create buffer")
            return
        }

        // just read whole file into buffer for simple test here. you can pass sample buffers to the detect in chunks
        // and it will assemble them.
        try audioFile.read(into: buffer)

        guard let rawData = buffer.floatChannelData?.pointee else { return }
        let channelCount = Int32(audioFile.fileFormat.channelCount)
        let sampleRate = Int32(audioFile.fileFormat.sampleRate)

        let bpmDetect = BPMDetectC()

        bpmDetect.process(rawData, numberOfSamples: Int32(frameCapacity), numberOfChannels: channelCount, sampleRate: sampleRate)

        let value = bpmDetect.getBpm()

        print(value, "bpm")
    }
}
