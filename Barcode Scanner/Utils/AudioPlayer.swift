import AVFoundation

struct AudioPlayer {
    private var audioPlayer: AVAudioPlayer?

    init(soundFileName: String) {
        prepareAudioPlayer(with: soundFileName)
    }

    private mutating func prepareAudioPlayer(with soundFileName: String) {
        if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Unable to initialize AVAudioPlayer: \(error)")
            }
        }
    }

    func playSound() {
        audioPlayer?.play()
    }
}
