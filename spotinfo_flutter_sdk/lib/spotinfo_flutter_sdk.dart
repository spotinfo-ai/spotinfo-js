// spotinfo_flutter_sdk/lib/spotinfo_flutter_sdk.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert'; // For jsonEncode

/// A Flutter widget to embed the Spotinfo chat widget with configurable options.
class SpotinfoWidget extends StatefulWidget {
  final String apiKey;
  final String? rootButtonLogo;
  final String? rootButtonHeight;
  final String? rootButtonWidth;
  final String? rootButtonShape;
  final String? rootLogoHeight;
  final String? rootLogoWidth;
  final String? viewType;
  final String? widgetWidth;
  final String? widgetHeight;
  final String? primaryColor;
  final String? secondaryColor;
  final String? messageTextColor;
  final String? buttonContentColor;
  final String? messageFontSize;
  final String? placeholder;
  final bool? userJourney;
  final bool? allowVoice;
  final bool? useWhatsapp;
  final String? whatsappGreeting;
  final Map<String, dynamic>? proactiveEngagement;

  // The URL to your remotely hosted spotinfo_widget.html
  // Set a sensible default here that merchants can override if needed (e.g., for staging).
  final String widgetHtmlUrl;

  const SpotinfoWidget({
    Key? key,
    required this.apiKey,
    this.rootButtonLogo,
    this.rootButtonHeight,
    this.rootButtonWidth,
    this.rootButtonShape,
    this.rootLogoHeight,
    this.rootLogoWidth,
    this.viewType,
    this.widgetWidth,
    this.widgetHeight,
    this.primaryColor,
    this.secondaryColor,
    this.messageTextColor,
    this.buttonContentColor,
    this.messageFontSize,
    this.placeholder,
    this.userJourney,
    this.allowVoice,
    this.useWhatsapp,
    this.whatsappGreeting,
    this.proactiveEngagement,
    // IMPORTANT: Replace this with YOUR actual hosted URL (e.g., your-spotinfo-cdn.com)
    this.widgetHtmlUrl = 'https://spotinfo.ai/spotinfo-widget/spotinfo_flutter_ai.html',
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
          onPageFinished: (String url) {
            // Inject configurations ONLY after the HTML page has fully loaded
            _injectConfigurations();
            setState(() { _isLoading = false; });
            debugPrint('WebView Page finished loading: $url');
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
      if (widget.rootButtonHeight != null) 'root-button-height': widget.rootButtonHeight,
      if (widget.rootButtonWidth != null) 'root-button-width': widget.rootButtonWidth,
      if (widget.rootButtonShape != null) 'root-button-shape': widget.rootButtonShape,
      if (widget.rootButtonLogo != null) 'root-button-logo': widget.rootButtonLogo,
      if (widget.rootLogoHeight != null) 'root-logo-height': widget.rootLogoHeight,
      if (widget.rootLogoWidth != null) 'root-logo-width': widget.rootLogoWidth,
      if (widget.viewType != null) 'view-type': widget.viewType,
      if (widget.widgetWidth != null) 'width': widget.widgetWidth,
      if (widget.widgetHeight != null) 'height': widget.widgetHeight,
      if (widget.primaryColor != null) 'primary-color': widget.primaryColor,
      if (widget.secondaryColor != null) 'secondary-color': widget.secondaryColor,
      if (widget.messageTextColor != null) 'message-text-color': widget.messageTextColor,
      if (widget.buttonContentColor != null) 'button-content-color': widget.buttonContentColor,
      if (widget.messageFontSize != null) 'message-font-size': widget.messageFontSize,
      if (widget.placeholder != null) 'placeholder': widget.placeholder,
      // Convert Dart bools to JavaScript boolean-like strings if needed,
      // or pass as native booleans if your JS can handle it (setAttribute takes strings)
      if (widget.userJourney != null) 'user-journey': widget.userJourney,
      if (widget.allowVoice != null) 'allow-voice': widget.allowVoice,
      if (widget.useWhatsapp != null) 'use-whatsapp': widget.useWhatsapp,
      if (widget.whatsappGreeting != null) 'whatsapp-greeting': widget.whatsappGreeting,
      if (widget.proactiveEngagement != null) 'proactive-engagement': widget.proactiveEngagement,
    };

    // Convert the Dart Map to a JSON string
    final String jsonConfig = jsonEncode(configMap);

    // Execute JavaScript to call the initSpotinfoWidget function with the full config
    // This relies on `initSpotinfoWidget` being available globally in the loaded HTML.
    _controller.runJavaScript(
      "initSpotinfoWidget($jsonConfig);"
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