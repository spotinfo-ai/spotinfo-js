# Installation

1. Add this to your pubspec.yaml:
```bash
dependencies:
  spotinfo_flutter_plugin:
    git:
      url: https://github.com/spotinfo-ai/spotinfo-js.git
      ref: v2.0.0
      path: spotinfo_flutter_plugin
```

2. Run
```bash
flutter pub get
```

# Usage

## Basic Usage

```bash
import 'package:spotinfo_flutter_plugin/spotinfo_flutter_plugin.dart';

SpotinfoWidget(
    apiKey: "YOUR_API_KEY",
    userJourney: false,
    allowVoice: false,
    useWhatsapp: false,
)
```

## Full example
```bash
SpotinfoWidget(
    apiKey: "YOUR_API_KEY",
    viewType: "sleek_view",
    primaryColor: '#3641db',
    secondaryColor: '#E9E6FF',
    placeholder: "Ask me anything...",
    userJourney: false,
    allowVoice: false,
    useWhatsapp: false,
)
```

## All Customization Options
```bash
SpotinfoWidget(
    apiKey: 'YOUR_API_KEY', // mandatory
    rootButtonShape: "circular", // Optional
    rootButtonHeight: "72px", // Optional
    rootButtonWidth: "72px", // Optional
    rootButtonLogo: 'https://spotinfo.ai/public_images/Spotinfo-White.svg', // Optional
    rootLogoHeight: "64px", // Optional
    rootLogoWidth: "64px", // Optional
    viewType: "sleek_view", // Optional
    widgetWidth: "150px", // Optional
    widgetHeight: "300px", // Optional
    primaryColor: '#3641db', // Optional
    secondaryColor: '#E9E6FF', // Optional
    messageTextColor: '#000000', // Optional
    buttonContentColor: '#ffffff', // Optional
    messageFontSize: '14px', // Optional
    placeholder: 'Ask me anything ...', // Optional
    userJourney: false, // keep false for app
    allowVoice: false, // set to true if you want to give voice option
    useWhatsapp: false,
)
```

# Platform Requirements

## Android

Ensure internet permission is added:
```bash
<uses-permission android:name="android.permission.INTERNET"/>
```

## iOS

Run
```bash
cd ios && pod install
```

# Support
Contact: admin@spotinfo.ai