import AudioKitPlaygrounds
import AudioKit

let file = try AKAudioFile(readFileName: "climax-disco-part2.wav", baseDir: .resources)
let player = try AKAudioPlayer(file: file)
player.looping = true

//let bitcrusher = AKBitCrusher(player)
//bitcrusher.bitDepth = 16
//bitcrusher.sampleRate = 40000
//AudioKit.output = bitcrusher

let delay = AKDelay(player)
delay.time = 0.1
delay.dryWetMix = 1

let leftPan = AKPanner(player, pan: -1)
let rightPan = AKPanner(delay, pan: 1)
let mix = AKMixer(leftPan, rightPan)

AudioKit.output = mix
try? AudioKit.start()

player.play()


import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
