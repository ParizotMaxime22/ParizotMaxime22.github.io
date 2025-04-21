import 'package:flutter/material.dart';
import '../components/navigation/top_navigation.dart';

class PortfolioLayout extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavigate;
  final Widget child;

  const PortfolioLayout({
    super.key,
    required this.currentIndex,
    required this.onNavigate,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Persistent top navigation bar
          TopNavigationBar(
            currentIndex: currentIndex,
            onTap: onNavigate,
          ),
          
          // Content area
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
