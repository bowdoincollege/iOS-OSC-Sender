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
preventing users from doing anythin on the device other than run the app.

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
