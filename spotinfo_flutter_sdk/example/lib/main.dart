import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // <--- NEW: Import for defaultTargetPlatform
// No longer needed for webview_flutter 4.x.x
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// Import your SDK package (it should be automatically resolved since it's in the parent directory)
import 'package:spotinfo_flutter_sdk/spotinfo_flutter_sdk.dart';

void main() {
  // Ensure Flutter widgets are initialized before WebView setup
  WidgetsFlutterBinding.ensureInitialized();

  // No longer explicitly required for webview_flutter 4.x.x+
  // The WebViewController itself handles platform initialization.
  // This code was for older versions or more specific scenarios.

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotinfo Flutter SDK Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Spotinfo Widget SDK Example'),
        ),
        body: Center(
          // Here's where you'll use your SpotinfoWidget
          child: SizedBox(
            width: 380, // Example size for the WebView container
            height: 580, // Example size for the WebView container
            child: SpotinfoWidget(
              apiKey: 'YOUR_EXAMPLE_API_KEY_HERE', // Use an example API key for testing
              rootButtonLogo: 'https://cdn.pixabay.com/photo/2017/03/19/08/32/online-2156828_960_720.png', // Example logo
              primaryColor: '#3641db',
              secondaryColor: '#E9E6FF',
              messageTextColor: '#000000',
              buttonContentColor: '#ffffff',
              messageFontSize: '14px',
              placeholder: 'Ask me anything or start voice interaction ...',
              userJourney: true,
              allowVoice: true,
              useWhatsapp: true,
              whatsappGreeting: 'Let\'s continue our interaction here (from example app).',
              proactiveEngagement: const {
                "enabled": true,
                "inactive": {
                  "enabled": true,
                  "timeoutSeconds": 25, // Slightly different timeout for example
                  "message": "Can I help you with something in the example app?"
                },
                "stuck": {
                  "enabled": true,
                  "timeoutSeconds": 15,
                  "proceedButtons": [
                    {
                      "captionContains": "Next",
                      "allowMultipleClicks": false
                    }
                  ],
                  "message": "Need help choosing an option in the example app?"
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}