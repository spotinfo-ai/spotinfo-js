import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // <--- NEW: Import for defaultTargetPlatform

// Import your spotinfo plugin
import 'package:spotinfo_flutter_plugin/spotinfo_flutter_plugin.dart';

void main() {
  // Ensure Flutter widgets are initialized before WebView setup
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
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
              // apiKey: 'YOUR_EXAMPLE_API_KEY_HERE', // mandatory
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
              userJourney: false, // keep flase for app
              allowVoice: false, // set to true if you want to give voice option
              useWhatsapp: false, // set to true if you want to give whatsapp option
            ),
          ),
        ),
      ),
    );
  }
}