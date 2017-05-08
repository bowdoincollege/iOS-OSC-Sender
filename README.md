# iOS OSC Sender

A simple iPad application to send [Open Sound Control
(OSC)](https://en.wikipedia.org/wiki/Open_Sound_Control) messages over WiFi.

This app was written specifically for a visual arts class at [Bowdoin
College](http://bowdoin.edu) to control
[Max/MSP](https://cycling74.com/products/max/) over WiFi as the app that comes
with Max uses Bonjour and does not work well in our enterprise WiFi environment.

# Configuration

The app must be configured in ```Settings``` with the IP address and port
to send message to. Settings was used rather than an in-app configuration
to allow the app to be put in single application or guided access mode, thus
preventing users from doing anything on the device other than run the app.

The messages sent by the buttons and the icons and text are not user
configurable in this version of the app.

The screen layout is designed for an iPad and has no code or configuration for
adapting to other screen sizes.

# OSC Messages

There are (currently) five message that the app sends to the OSC destination.
These are, amazingly, sent based on which of the five on-screen buttons are
pressed.

1. ```/button-1```
1. ```/button-2```
1. ```/button-3```
1. ```/button-4```
1. ```/button-5```

The ```SOUND``` button triggers playback (and stopping) of a built in audio
narration track.

# Compiling/Building

This project uses [cocoapods](https://cocoapods.org) and the
[OSCKit](https://cocoapods.org/?q=osckit) pod. To build the project you will
have to install cocoapods and update/install the pods before building the
project/workspace.

```
# Xcode 7 + 8
$ sudo gem install cocoapods
$ pod install
```

Please refer to the [cocoapods](https://cocoapods.org) website for the latest
instructions on installing and using cocoapods.