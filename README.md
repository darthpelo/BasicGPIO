# BasicGPIO
This is a simple example to show how to use [SwiftGPIO](https://github.com/uraimo/SwiftyGPIO) by @uraimo on a Raspberry Pi.

## Board


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
