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
    apiKey: 'YOUR_API_KEY', // mandatory
    userId: 'YOUR_USER_ID', // optional

    // Core
    userJourney: false,
    allowVoice: false, // set to true if you want to give voice option
    useWhatsapp: false,
    whatsappGreeting: "Let's continue our interaction here.",
    useTelephony: false, // option for users to call Agent on Phone
    autoInitiate: false, // If true, agent will start voice chat automatically after autoInitiateTime seconds

    // Colors & Typography
    primaryColor: '#3641db',
    secondaryColor: '#E9E6FF',
    messageTextColor: '#000000',
    buttonContentColor: '#ffffff',
    botName: 'Riya',

    // Chat History
    showClientId: true,
)
```

## All Customization Options
```bash
SpotinfoWidget(
    apiKey: 'YOUR_API_KEY', // mandatory
    userId: 'YOUR_USER_ID', // optional

    // Core
    userJourney: false,
    allowVoice: false, // set to true if you want to give voice option
    useWhatsapp: false,
    whatsappGreeting: "Let's continue our interaction here.",
    useTelephony: false, // option for users to call Agent on Phone
    autoInitiate: false, // If true, agent will start voice chat automatically after autoInitiateTime seconds
    autoInitiateTime: 5,

    // Colors & Typography
    primaryColor: '#3641db',
    secondaryColor: '#E9E6FF',
    messageTextColor: '#000000',
    buttonContentColor: '#ffffff',
    fontFamily: 'Inter',
    messageFontSize: '14px',
    botName: 'Riya',

    // Launcher Button
    rootButtonHeight: '48px',
    rootButtonWidth: '48px',
    rootButtonShape: 'circular-pill', // circular-pill | boxed-pill | circular | boxed
    rootButtonShapeMobile: 'circular-pill', // circular-pill | boxed-pill | circular | boxed
    rootButtonLogo: 'https://spotinfo.ai/public_images/female agent.png',
    rootLogoHeight: '40px',
    rootLogoWidth: '40px',
    rootBorderColor: '#3641db',
    rootTextColor: '#3641db',
    desktopXOffset: '20px',
    desktopYOffset: '20px',
    mobileXOffset: '-40vw',
    mobileYOffset: '-80vh',
    rootTitle: 'Ask Riya',
    rootSubtitle: 'Online · replies in 10s',

    // Main Widget
    widgetWidth: '400px',
    widgetHeight: '600px',
    placeholder: 'Type your question here...',
    headerLogo: 'https://spotinfo.ai/public_images/female agent.png',
    showTimestamp: true,
    showDateSeparator: true,
    showAvatars: true,
    aiAvatar: 'https://spotinfo.ai/public_images/Spotinfo-White.png',

    // Popup
    showPopupPrimaryBtn: false,

    // Chat History
    showClientId: true,
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
