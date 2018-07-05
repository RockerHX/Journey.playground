import AudioKitPlaygrounds
import AudioKit


let oscillator = AKOscillator()

AudioKit.output = oscillator
try? AudioKit.start()

oscillator.start()

sleep(10)
