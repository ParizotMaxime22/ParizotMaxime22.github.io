import 'package:flutter/material.dart';
import '../../models/project.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screenshot_gallery.dart';

class ProjectPopup extends StatelessWidget {
  final Project project;
  final VoidCallback onClose;

  const ProjectPopup({
    super.key,
    required this.project,
    required this.onClose,
  });

  void _openScreenshotGallery(BuildContext context, List<String> screenshots, int initialIndex) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ScreenshotGallery(
          screenshots: screenshots,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with close button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    project.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close),
                    splashRadius: 24,
                  ),
                ],
              ),
            ),

            // The scrollable area now includes the logo
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project image/logo at top of scrollview, resizable
                    LayoutBuilder(
                      builder: (context, constraints) {
                        // Maximum size: 250. Otherwise, fit inside width or 250, whichever is less
                        final double maxLogoSize = 250;
                        double available = constraints.maxWidth;
                        double logoSize = available < maxLogoSize ? available : maxLogoSize;
                        return Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              project.imageUrl.startsWith('assets/') ? project.imageUrl : 'assets/${project.imageUrl}',
                              width: logoSize,
                              height: logoSize,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: logoSize,
                                  height: logoSize,
                                  color: Colors.grey.shade300,
                                  child: const Icon(Icons.broken_image, size: 60),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Project details below logo
                    const Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Technologies utilisées:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies.map((tech) {
                        return Chip(
                          label: Text(tech),
                          backgroundColor: Colors.blue.shade100,
                        );
                      }).toList(),
                    ),
                    if (project.linkUrl != null) ...[
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final url = project.linkUrl;
                          if (url != null && await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(
                              Uri.parse(url),
                              mode: LaunchMode.externalApplication,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Impossible d\'ouvrir le lien.')),
                            );
                          }
                        },
                        icon: const Icon(Icons.link),
                        label: const Text('Lien du Project'),
                      ),
                    ],
                    if (project.screenshots != null && project.screenshots!.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      const Text(
                        'Capture d\'écrans du projet:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final double itemHeight = constraints.maxWidth > 600 ? 250 : 200;
                          return SizedBox(
                            height: itemHeight,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: project.screenshots!.length,
                              itemBuilder: (context, index) {
                                final String imagePath = project.screenshots![index].startsWith('assets/') 
                                  ? project.screenshots![index] 
                                  : 'assets/${project.screenshots![index]}';
                                
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _openScreenshotGallery(
                                        context, 
                                        project.screenshots!,
                                        index,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        imagePath,
                                        height: itemHeight,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            width: 150,
                                            height: itemHeight,
                                            color: Colors.grey.shade300,
                                            child: const Center(
                                              child: Icon(Icons.broken_image, size: 40),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    ),
  );}}