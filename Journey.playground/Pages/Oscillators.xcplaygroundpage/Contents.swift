import AudioKitPlaygrounds
import AudioKit


let oscillator = AKOscillator()
oscillator.frequency = 300
oscillator.amplitude = 0.5

AudioKit.output = oscillator
try? AudioKit.start()

oscillator.start()

oscillator.rampDuration = 0.2
oscillator.frequency = 500


import AudioKitUI

AKPlaygroundLoop(every: 0.5) {
    oscillator.frequency = (oscillator.frequency == 500 ? 100 : 500)
}


import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
