# spotinfo_flutter_plugin

A new Flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

The plugin project was generated without specifying the `--platforms` flag, no platforms are currently supported.
To add platforms, run `flutter create -t plugin --platforms <platforms> .` in this directory.
You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/to/pubspec-plugin-platforms.

# Local Testing Settings
## Changes to spotinfo_flutter_ai.html
- umdScriptUrl => change to 'spotinfo-widget.umd.js' 
  - It will pick local file

- Deploy file on local using
```
python3 -m http.server 8000
```

- Local HTML file will be available on:
  - http://192.168.1.12:8000/spotinfo_flutter_ai.html
    - http://<mac_IP>:8000/spotinfo_flutter_ai.html
  - http://localhost:8000/spotinfo_flutter_ai.html

## Changes to pubspec.yaml in example
### Prod Value
```
dependencies:
  flutter:
    sdk: flutter
  webview_flutter: ^4.0.0
  spotinfo_flutter_plugin:
    git:
      url: https://github.com/spotinfo-ai/spotinfo-js.git
      ref: main
      path: spotinfo_flutter_plugin
```

### Testing Value
```
dependencies:
  flutter:
    sdk: flutter
  webview_flutter: ^4.0.0
  spotinfo_flutter_plugin:
    path: ..
#    git:
#      url: https://github.com/spotinfo-ai/spotinfo-js.git
#      ref: v2.0.0
#      path: spotinfo_flutter_plugin
```

## Changes to spotinfo.webview.dart in root>lib
- this.widgetHtmlUrl = 'http://192.168.1.12:8000/spotinfo_flutter_ai.html'
  - this.widgetHtmlUrl = 'http://<mac_IP>>:8000/spotinfo_flutter_ai.html'

## Testing Commands
**in example folder**
- Clean previous build
```
flutter clean
```
- Install Packages
```
flutter pub get
```
- Get list of devices
```
flutter devices
```
- Run on local device/ Mobile
```
flutter run -d <device_id>
flutter run -d S4IRQSQ8XOFICMHY
```

- in chrome on browser open 
  - chrome://inspect/#devices
  - Once app loads, we will be able to check webview console and network here


