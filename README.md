# BasicGPIO
This is a simple example to show how to use [SwiftGPIO](https://github.com/uraimo/SwiftyGPIO) by @uraimo on a Raspberry Pi 2.
The purpose is very simple: swicth on/off or blink 3 leds conected to the RPi with two different GPIO.

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
![running](https://github.com/darthpelo/BasicGPIO/blob/master/images/2016-11-20%2012.01.48.gif)

### Credits
Thanks to @uraimo, @iachievedit and @ubidefeo for the help to setup properly Swift, SwiftGPIO and the board 😃.
### References
- [Swift 3.0 on Raspberry Pi 2 and 3](http://dev.iachieved.it/iachievedit/swift-3-0-on-raspberry-pi-2-and-3/)
- [SwiftGPIO](https://github.com/uraimo/SwiftyGPIO)
- SwiftGPIO [examples](https://github.com/uraimo/SwiftyGPIO/tree/master/Examples)
- Trubles with RPi, Ubuntu and eth0? [👉solution](https://medium.com/@darthpelo/raspberry-pi-ubuntu-and-the-missed-eth0-58f134aa961e#.diid7xp7x) 
