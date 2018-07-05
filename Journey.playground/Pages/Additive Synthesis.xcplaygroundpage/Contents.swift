import AudioKitPlaygrounds
import AudioKit

func createAndStartOscillator(frequency: Double) -> AKOscillator {
    let oscillator = AKOscillator()
    oscillator.frequency = frequency
    return oscillator
}

let frequencies = (1...5).map { $0 * 261.63 }

let oscillators = frequencies.map {
    createAndStartOscillator(frequency: $0)
}

let mixer = AKMixer()
oscillators.forEach { mixer.connect(input: $0) }

let envelope = AKAmplitudeEnvelope(mixer)
envelope.attackDuration = 0.01
envelope.decayDuration = 0.1
envelope.sustainLevel = 0.1
envelope.releaseDuration = 0.3

AudioKit.output = envelope
try? AudioKit.start()

oscillators.map { $0.start() }


import AudioKitUI

AKPlaygroundLoop(every: 0.5) {
    if (envelope.isStarted) {
        envelope.stop()
    } else {
        envelope.start()
    }
}

class LiveView: AKLiveViewController {

    override func viewDidLoad() {
        addTitle("Mixer")

        oscillators.forEach { oscillator in
            let slider = AKSlider(property: "\(oscillator.frequency) Hz", value: oscillator.amplitude) { amplitude in
                oscillator.amplitude = amplitude
            }
            addView(slider)
        }
    }
}


import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = LiveView()
