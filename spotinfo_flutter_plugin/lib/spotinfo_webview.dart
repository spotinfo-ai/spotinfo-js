// spotinfo_flutter_sdk/lib/spotinfo_flutter_sdk.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert'; // For jsonEncode

/// A Flutter widget to embed the Spotinfo chat widget with configurable options.
class SpotinfoWidget extends StatefulWidget {
  final String apiKey;
  final String? userId;

  // Core
  final bool? userJourney;
  final bool? allowVoice;
  final bool? useWhatsapp;
  final String? whatsappGreeting;
  final bool? useTelephony;
  final bool? autoInitiate;
  final int? autoInitiateTime;

  // Colors & Typography
  final String? primaryColor;
  final String? secondaryColor;
  final String? messageTextColor;
  final String? buttonContentColor;
  final String? fontFamily;
  final String? messageFontSize;
  final String? botName;

  // Launcher Button
  final String? rootButtonHeight;
  final String? rootButtonWidth;
  final String? rootButtonShape;
  final String? rootButtonShapeMobile;
  final String? rootButtonLogo;
  final String? rootLogoHeight;
  final String? rootLogoWidth;
  final String? rootBorderColor;
  final String? rootTextColor;
  final String? desktopXOffset;
  final String? desktopYOffset;
  final String? mobileXOffset;
  final String? mobileYOffset;
  final String? rootTitle;
  final String? rootSubtitle;

  // Main Widget
  final String? viewType;
  final String? widgetWidth;
  final String? widgetHeight;
  final String? placeholder;
  final String? headerLogo;
  final bool? showTimestamp;
  final bool? showDateSeparator;
  final bool? showAvatars;
  final String? aiAvatar;
  final String? footerText;

  // Popup
  final String? popupType;
  final bool? showPopupPrimaryBtn;

  // Debug / Misc
  final bool? showClientId;

  // Proactive Engagement
  final Map<String, dynamic>? proactiveEngagement;

  // The URL to your remotely hosted spotinfo_widget.html
  // Set a sensible default here that merchants can override if needed (e.g., for staging).
  final String widgetHtmlUrl;

  const SpotinfoWidget({
    Key? key,
    required this.apiKey,
    this.userId,

    // Core
    this.userJourney,
    this.allowVoice,
    this.useWhatsapp,
    this.whatsappGreeting,
    this.useTelephony,
    this.autoInitiate,
    this.autoInitiateTime,

    // Colors & Typography
    this.primaryColor,
    this.secondaryColor,
    this.messageTextColor,
    this.buttonContentColor,
    this.fontFamily,
    this.messageFontSize,
    this.botName,

    // Launcher Button
    this.rootButtonHeight,
    this.rootButtonWidth,
    this.rootButtonShape,
    this.rootButtonShapeMobile,
    this.rootButtonLogo,
    this.rootLogoHeight,
    this.rootLogoWidth,
    this.rootBorderColor,
    this.rootTextColor,
    this.desktopXOffset,
    this.desktopYOffset,
    this.mobileXOffset,
    this.mobileYOffset,
    this.rootTitle,
    this.rootSubtitle,

    // Main Widget
    this.viewType,
    this.widgetWidth,
    this.widgetHeight,
    this.placeholder,
    this.headerLogo,
    this.showTimestamp,
    this.showDateSeparator,
    this.showAvatars,
    this.aiAvatar,
    this.footerText,

    // Popup
    this.popupType,
    this.showPopupPrimaryBtn,

    // Debug / Misc
    this.showClientId,

    // Proactive Engagement
    this.proactiveEngagement,


    // IMPORTANT: Replace this with YOUR actual hosted URL (e.g., your-spotinfo-cdn.com)
    this.widgetHtmlUrl = 'https://www.spotinfo.ai/js/spotinfo_flutter_ai.html',

//     this.widgetHtmlUrl = 'http://192.168.1.12:8000/spotinfo_flutter_ai.html',
  }) : super(key: key);

  @override
  State<SpotinfoWidget> createState() => _SpotinfoWidgetState();
}

class _SpotinfoWidgetState extends State<SpotinfoWidget> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000)) // Transparent background
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // You can use this to show a loading percentage
          },
          onPageStarted: (String url) {
            setState(() { _isLoading = true; });
            debugPrint('WebView Page started loading: $url');
          },
          onPageFinished: (String url) async {
            debugPrint('WebView Page finished loading: $url');

            final typeofInit = await _controller.runJavaScriptReturningResult(
              "typeof window.initSpotinfoWidget"
            );
//             debugPrint("TYPEOF INIT = $typeofInit");
            if (typeofInit.toString().contains("function")) {
              _injectConfigurations();
            } else {
              debugPrint("initSpotinfoWidget not ready");
            }

            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView Web resource error: ${error.description}');
            // Consider displaying an error message to the user
          },
        ),
      );

    // Load the remote HTML directly from your CDN/Worker
    _controller.loadRequest(Uri.parse(widget.widgetHtmlUrl));
  }

  // This method prepares all configurations into a JSON object and injects it into the WebView.
  void _injectConfigurations() {
    final Map<String, dynamic> configMap = {
      'api-key': widget.apiKey,
      if (widget.userId != null) 'user-id': widget.userId,

      // Core
      if (widget.userJourney != null) 'user-journey': widget.userJourney,
      if (widget.allowVoice != null) 'allow-voice': widget.allowVoice,
      if (widget.useWhatsapp != null) 'use-whatsapp': widget.useWhatsapp,
      if (widget.whatsappGreeting != null) 'whatsapp-greeting': widget.whatsappGreeting,
      if (widget.useTelephony != null) 'use-telephony': widget.useTelephony,
      if (widget.autoInitiate != null) 'auto-initiate': widget.autoInitiate,
      if (widget.autoInitiateTime != null) 'auto-initiate-time': widget.autoInitiateTime,

      // Colors & Typography
      if (widget.primaryColor != null) 'primary-color': widget.primaryColor,
      if (widget.secondaryColor != null) 'secondary-color': widget.secondaryColor,
      if (widget.messageTextColor != null) 'message-text-color': widget.messageTextColor,
      if (widget.buttonContentColor != null) 'button-content-color': widget.buttonContentColor,
      if (widget.fontFamily != null) 'font-family': widget.fontFamily,
      if (widget.messageFontSize != null) 'message-font-size': widget.messageFontSize,
      if (widget.botName != null) 'bot-name': widget.botName,

      // Launcher Button
      if (widget.rootButtonHeight != null) 'root-button-height': widget.rootButtonHeight,
      if (widget.rootButtonWidth != null) 'root-button-width': widget.rootButtonWidth,
      if (widget.rootButtonShape != null) 'root-button-shape': widget.rootButtonShape,
      if (widget.rootButtonShapeMobile != null) 'root-button-shape-mobile': widget.rootButtonShapeMobile,
      if (widget.rootButtonLogo != null) 'root-button-logo': widget.rootButtonLogo,
      if (widget.rootLogoHeight != null) 'root-logo-height': widget.rootLogoHeight,
      if (widget.rootLogoWidth != null) 'root-logo-width': widget.rootLogoWidth,
      if (widget.rootBorderColor != null) 'root-border-color': widget.rootBorderColor,
      if (widget.rootTextColor != null) 'root-text-color': widget.rootTextColor,
      if (widget.desktopXOffset != null) 'desktop-x-offset': widget.desktopXOffset,
      if (widget.desktopYOffset != null) 'desktop-y-offset': widget.desktopYOffset,
      if (widget.mobileXOffset != null) 'mobile-x-offset': widget.mobileXOffset,
      if (widget.mobileYOffset != null) 'mobile-y-offset': widget.mobileYOffset,
      if (widget.rootTitle != null) 'root-title': widget.rootTitle,
      if (widget.rootSubtitle != null) 'root-subtitle': widget.rootSubtitle,

      // Main Widget
      if (widget.viewType != null) 'view-type': widget.viewType,
      if (widget.widgetWidth != null) 'width': widget.widgetWidth,
      if (widget.widgetHeight != null) 'height': widget.widgetHeight,
      if (widget.placeholder != null) 'placeholder': widget.placeholder,
      if (widget.headerLogo != null) 'header-logo': widget.headerLogo,
      if (widget.showTimestamp != null) 'show-timestamp': widget.showTimestamp,
      if (widget.showDateSeparator != null) 'show-date-separator': widget.showDateSeparator,
      if (widget.showAvatars != null) 'show-avatars': widget.showAvatars,
      if (widget.aiAvatar != null) 'ai-avatar': widget.aiAvatar,
      if (widget.footerText != null) 'footer-text': widget.footerText,

      // Popup
      if (widget.popupType != null) 'popup-type': widget.popupType,
      if (widget.showPopupPrimaryBtn != null) 'show-popup-primary-btn': widget.showPopupPrimaryBtn,

      // Debug / Misc
      if (widget.showClientId != null) 'show-client-id': widget.showClientId,

      // Proactive Engagement
      if (widget.proactiveEngagement != null) 'proactive-engagement': widget.proactiveEngagement,
    };

    debugPrint("========== SPOTINFO CONFIG ==========");

    // Convert the Dart Map to a JSON string
    final encoder = const JsonEncoder.withIndent('  ');
    debugPrint(encoder.convert(configMap));

    final String jsonConfig = jsonEncode(configMap);

    debugPrint("Calling initSpotinfoWidget");

    // Execute JavaScript to call the initSpotinfoWidget function with the full config
    // This relies on `initSpotinfoWidget` being available globally in the loaded HTML.
    _controller.runJavaScript(
      """
      console.log("CONFIG_FROM_FLUTTER", $jsonConfig);
      initSpotinfoWidget($jsonConfig);
      """
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: _controller),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
