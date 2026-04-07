import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // <--- NEW: Import for defaultTargetPlatform
// No longer needed for webview_flutter 4.x.x
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// Import your SDK package (it should be automatically resolved since it's in the parent directory)
import 'package:spotinfo_flutter_plugin/spotinfo_flutter_plugin.dart';

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
              // apiKey: 'YOUR_EXAMPLE_API_KEY_HERE',
              apiKey: "siakqq4nkogd3ehyeyxh",
              rootButtonShape: "circular", // Optional
              rootButtonHeight: "72px", // Optional
              rootButtonWidth: "72px", // Optional
              rootButtonLogo: 'https://cdn.pixabay.com/photo/2017/03/19/08/32/online-2156828_960_720.png', // Optional
              rootLogoHeight: "64px",
              rootLogoWidth: "64px",
              viewType: "sleek_view",
              widgetWidth: "200px",
              widgetHeight: "300px",
              primaryColor: '#3641db',
              secondaryColor: '#E9E6FF',
              messageTextColor: '#000000',
              buttonContentColor: '#ffffff',
              messageFontSize: '14px',
              placeholder: 'Ask me anything or start voice interaction ...',
              userJourney: false,
              allowVoice: false,
              useWhatsapp: false,
            ),
          ),
        ),
      ),
    );
  }
}