import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Import spotinfo plugin
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
                apiKey: 'YOUR_API_KEY_HERE', // mandatory
                userId: 'YOUR_USER_ID_HERE',

                // Core
                userJourney: false,
                allowVoice: true,
                useWhatsapp: false,
                whatsappGreeting: "Let's continue our interaction here.",
                useTelephony: false,
                autoInitiate: false,
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
                rootButtonShape: 'circular-pill',
                rootButtonShapeMobile: 'circular-pill',
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
                viewType: 'modern_view',
                widgetWidth: '400px',
                widgetHeight: '600px',
                placeholder: 'Type your question here...',
                headerLogo: 'https://spotinfo.ai/public_images/female agent.png',
                showTimestamp: true,
                showDateSeparator: true,
                showAvatars: true,
                aiAvatar: 'https://spotinfo.ai/public_images/Spotinfo-White.png',
                footerText: 'Powered by SpotInfo',

                // Popup
                popupType: 'modern',
                showPopupPrimaryBtn: false,

                // Chat History
                showClientId: true,
            ),
          ),
        ),
      ),
    );
  }
}
