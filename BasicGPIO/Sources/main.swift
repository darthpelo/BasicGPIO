import Glibc
import SwiftyGPIO

enum Command: Int {
    case one
    case two
    case blink
}

guard CommandLine.arguments.count == 2 else {
  print("Usage:  BasicGPIO VALUE")
  exit(-1)
}

let led = Int(CommandLine.arguments[1])

func switchOn(led: Command?) {
guard let led = led else {
        return
    }
let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPi2)

let gp1 = gpios[.P17]!
let gp2 = gpios[.P18]!

gp1.direction = .OUT
gp2.direction = .OUT

gp1.value = 0
gp2.value = 0 

switch(led) {
    case .one:
        gp1.value = 1
        gp2.value = 0
    case .two:
        gp2.value = 1
        gp1.value = 0
    case .blink:
	while true {
    		gp1.value = gp1.value == 0 ? 1 : 0
    		gp2.value = gp2.value == 0 ? 1 : 0
    		usleep(200*1000)
	}	
}
}

switchOn(led: Command(rawValue:led!))

/*
while true {    
    gp1.value = gp1.value == 0 ? 1 : 0
    gp2.value = gp2.value == 0 ? 1 : 0
    usleep(200*1000)
}
*/
