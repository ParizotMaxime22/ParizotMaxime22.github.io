import 'package:web/web.dart' as web;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';

class WebInitialize {
  static void registerWebView() {
    if (!kIsWeb) return;
    // Get the correct base path for assets
    final base = web.window.location.pathname;
    // Guarantee trailing /
    final normalizedBase = base.endsWith('/') ? base : '$base/';
    final assetPath = '${normalizedBase}assets/assets/cv_maxime_parizot.png';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'cv-image',
          (int viewId) {
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