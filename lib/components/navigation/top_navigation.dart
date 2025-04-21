import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<String> pageTitles = const ['Présentation', 'Mes projets', 'Me contacter'];
  final List<IconData> pageIcons = const [FontAwesomeIcons.user, FontAwesomeIcons.cog, FontAwesomeIcons.envelope];

  const TopNavigationBar({
    super.key, 
    required this.currentIndex, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(163, 255, 183, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(pageTitles.length, (index) {
          return Expanded(
            child: _buildNavItem(index),
          );
        }),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final bool isActive = index == currentIndex;
    
    return InkWell(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: isActive ? Colors.black.withOpacity(0.05) : Colors.transparent,
          boxShadow: isActive 
              ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))] 
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              pageIcons[index],
              color: isActive ? const Color(0xFF8D73E2) : Colors.black.withOpacity(0.7),
              size: 25,
            ),
            const SizedBox(width: 10),
            Text(
              pageTitles[index],
              style: TextStyle(
                fontSize: 19,
                color: isActive ? const Color(0xFF8D73E2) : Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
