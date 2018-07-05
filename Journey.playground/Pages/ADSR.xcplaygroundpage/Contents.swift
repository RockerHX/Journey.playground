import AudioKitPlaygrounds
import AudioKit


let oscillator = AKOscillator()

let envelope = AKAmplitudeEnvelope(oscillator)
envelope.attackDuration = 0.01
envelope.decayDuration = 0.1
envelope.sustainLevel = 0.1
envelope.releaseDuration = 0.3

AudioKit.output = envelope
try? AudioKit.start()

oscillator.start()


import AudioKitUI

AKPlaygroundLoop(every: 0.5) {
    if (envelope.isStarted) {
        envelope.stop()
    } else {
        envelope.start()
    }
}


import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
