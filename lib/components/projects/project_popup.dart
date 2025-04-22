import 'package:flutter/material.dart';
import '../../models/project.dart';

class ProjectPopup extends StatelessWidget {
  final Project project;
  final VoidCallback onClose;

  const ProjectPopup({
    super.key,
    required this.project,
    required this.onClose,
  });

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
            
            // Project image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    project.imageUrl,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 250,
                        height: 250,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.broken_image, size: 60),
                      );
                    },
                  ),
                ),
              ),
            ),
            
            // Project details
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
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
                      'Technologies:',
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
                        onPressed: () {
                          // URL launching functionality would go here
                        },
                        icon: const Icon(Icons.link),
                        label: const Text('Visit Project'),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
