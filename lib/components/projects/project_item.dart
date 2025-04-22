import 'package:flutter/material.dart';
import '../../models/project.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final VoidCallback onTap;

  const ProjectItem({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
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
          const SizedBox(height: 8),
          Text(
            project.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
