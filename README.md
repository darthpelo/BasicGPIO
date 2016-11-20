# BasicGPIO
This is a simple example to show how to use [SwiftGPIO](https://github.com/uraimo/SwiftyGPIO) by @uraimo on a Raspberry Pi 2.

## Board
Raspberry connections
![raspebrry](https://github.com/darthpelo/BasicGPIO/blob/master/images/2016-11-20%2011.34.55.jpg)

Board, with 3 leds and 2 resisance 300ohm
![board](https://github.com/darthpelo/BasicGPIO/blob/master/images/2016-11-20%2011.35.09.jpg)

## Build and Run
```
cd BasicGPIO
swift build
sudo .build/debug/BasicGPIO VALUE
```
*VALUE*:
```
enum Command: Int {
    case one
    case two
    case blink
}
```
