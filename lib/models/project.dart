import 'package:flutter/foundation.dart';

class Project {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> technologies;
  final String? linkUrl;

  const Project({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.technologies,
    this.linkUrl,
  });
  
  /// Gets the correct image URL depending on the platform and environment
  String getImageUrl() {
    if (!kIsWeb) {
      // Standard path for mobile/desktop
      return imageUrl.startsWith('assets/') ? imageUrl : 'assets/$imageUrl';
    }
    
    // For web platforms, we need to handle GitHub Pages path differences
    final String standardPath = imageUrl.startsWith('assets/') ? imageUrl : 'assets/$imageUrl';
    return standardPath;
  }
}
