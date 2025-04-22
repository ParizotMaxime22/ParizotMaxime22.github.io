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
        final assetPath = '${web.window.location.pathname}assets/cv.png';
        final imageElement = web.HTMLImageElement()
          ..src = assetPath
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.objectFit = 'contain'
          ..style.display = 'block';
        return imageElement;
      },
    );
  }
}
