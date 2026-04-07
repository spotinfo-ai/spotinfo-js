import 'package:flutter/material.dart';
import 'spotinfo_webview.dart';

class SpotInfo {
  static void openChat(
    BuildContext context, {
    required String apiKey,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          body: SpotinfoWidget(apiKey: apiKey),
        ),
      ),
    );
  }
}