import 'package:flutter/material.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name Header
          Text(
            'Maxime Parizot',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),

          // Profile Picture
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/profile_picture.png', // Make sure to add your image to assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Introduction Text
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyLarge?.color,
                height: 1.5,
              ),
              children: const [
                TextSpan(
                  text: "Si vous êtes ici, c'est que vous avez pris le temps d'en apprendre plus sur moi, et je vous en remercie.\n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Here's my story and how I got here...\n",
                  // Add your personal story and journey here
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // CV Section
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/cv.png', // Make sure to add your CV image to assets
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}