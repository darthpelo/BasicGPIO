import Glibc
import SwiftyGPIO

enum Command: Int {
    case Button
}

var bluLed: GPIO?
var redLed: GPIO?
var bluButton: GPIO?
var redButton: GPIO?

guard CommandLine.arguments.count == 2 else {
    print("Usage:  BasicGPIO VALUE")
    exit(-1)
}

private func setupLEDs() {
    let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPi2)

    bluLed = gpios[.P20]!
    redLed = gpios[.P26]!

    bluLed?.direction = .OUT
    redLed?.direction = .OUT

    bluLed?.value = 0
    redLed?.value = 0
}

private func setupButtons() {
    let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPi2)

    bluButton = gpios[.P19]!
    redButton = gpios[.P16]!

    bluButton?.direction = .IN
    redButton?.direction = .IN
}

func switchOn(led: Command?) {
    guard let led = led else {
        return
    }

    switch(led) {
    case .button:
        setupLEDs()
        setupButtons()

        while true {
            if let value = bluButton?.value {
                print("blu " + "\(value)")
            }
            if let value = redButton?.value {
                print("red " + "\(value)")
            }
        }
    }
}

let led = Int(CommandLine.arguments[1])

switchOn(led: Command(rawValue:led!))
