import Glibc
import SwiftyGPIO

enum Command: Int {
    case one
    case two
    case blink
    case button
}

var gp1: GPIO?
var gp2: GPIO?

guard CommandLine.arguments.count == 2 else {
    print("Usage:  BasicGPIO VALUE")
    exit(-1)
}

private func setupOUT() {
    let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPi2)
    
    gp1 = gpios[.P17]!
    gp2 = gpios[.P18]!
    
    gp1?.direction = .OUT
    gp2?.direction = .OUT
    
    gp1?.value = 0
    gp2?.value = 0
}

private func setupIN() {
    let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPi2)
    
    gp1 = gpios[.P17]!
    gp2 = gpios[.P18]!
    
    gp1?.direction = .IN
    gp2?.direction = .IN
}

func switchOn(led: Command?) {
    guard let led = led else {
        return
    }
    
    switch(led) {
    case .one:
        setupOUT()
        gp1?.value = 1
        gp2?.value = 0
    case .two:
        setupOUT()
        gp2?.value = 1
        gp1?.value = 0
    case .blink:
        setupOUT()
        while true {
            gp1?.value = gp1?.value == 0 ? 1 : 0
            gp2?.value = gp2?.value == 0 ? 1 : 0
            usleep(200*1000) // 200ms
        }
    case .button:
        setupIN()
        while true {
            print(gp1?.value)
            usleep(10*1000) // 10ms
        }
    }
}

let led = Int(CommandLine.arguments[1])

switchOn(led: Command(rawValue:led!))

