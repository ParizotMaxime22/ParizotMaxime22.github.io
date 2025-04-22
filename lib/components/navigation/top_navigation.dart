import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<String> pageTitles = const ['Présentation', 'Mes projets', 'Me contacter'];
  final List<IconData> pageIcons = const [FontAwesomeIcons.user, FontAwesomeIcons.gear, FontAwesomeIcons.envelope];

  const TopNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(166, 163, 255, 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(150),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(pageTitles.length, (index) {
          return Expanded(
            child: _buildNavItem(index, context),
          );
        }),
      ),
    );
  }

  Widget _buildNavItem(int index, BuildContext context) {
    final bool isActive = index == currentIndex;
    // Get the current screen width to calculate responsive sizes
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate responsive font and icon sizes
    // Set minimum and maximum font sizes
    final double minFontSize = 16;
    final double maxFontSize = 25;
    // Calculate font size based on screen width with constraints
    final double fontSize = (screenWidth / 70).clamp(minFontSize, maxFontSize);
    
    // Calculate icon size proportionally
    final double iconSize = fontSize;
    
    // Calculate spacing proportionally
    final double spacing = (screenWidth / 150).clamp(4, 10);

    return InkWell(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12, 
          horizontal: (screenWidth / 100).clamp(5, 15),
        ),
        decoration: BoxDecoration(
          color: isActive ? Colors.black.withAlpha(13) : Colors.transparent,
          boxShadow: isActive
              ? [BoxShadow(color: Colors.black.withAlpha(26), blurRadius: 4, offset: const Offset(0, 2))]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              pageIcons[index],
              color: isActive ? const Color(0xFFFDFDFD) : Colors.black.withAlpha(179),
              size: iconSize,
            ),
            SizedBox(width: spacing),
            Flexible(
              child: Text(
                pageTitles[index],
                style: TextStyle(
                  fontSize: fontSize,
                  color: isActive ? const Color(0xFFFDFDFD) : Colors.black.withAlpha(179),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}