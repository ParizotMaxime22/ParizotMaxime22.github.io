import 'package:web/web.dart' as web;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';

class WebInitialize {
  static void registerWebView() {
    if (!kIsWeb) return;
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'cv-image',
          (int viewId) {
        final imageElement = web.HTMLImageElement()
          ..src = 'assets/cv.png'
          ..style.width = '100%'
          ..style.height = '100%'  // Ensure it fills the container
          ..style.objectFit = 'contain'
          ..style.display = 'block' // Remove default inline gap
          ..style.margin = '0 auto'; // Center horizontally if needed
        return imageElement;
      },
    );
  }
}
