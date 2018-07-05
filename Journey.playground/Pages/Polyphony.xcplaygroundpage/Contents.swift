import AudioKitPlaygrounds
import AudioKit

let bank = AKOscillatorBank()
AudioKit.output = bank
try? AudioKit.start()


import AudioKitUI

class LiveView: AKLiveViewController, AKKeyboardDelegate {

    override func viewDidLoad() {
        addTitle("Keyboard")
        let keyboard = AKKeyboardView(width: 440, height: 100)
        keyboard.delegate = self
        keyboard.polyphonicMode = true
        addView(keyboard)
    }

    func noteOn(note: MIDINoteNumber) {
        bank.play(noteNumber: note, velocity: 80)
    }

    func noteOff(note: MIDINoteNumber) {
        bank.stop(noteNumber: note)
    }
}


import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = LiveView()
