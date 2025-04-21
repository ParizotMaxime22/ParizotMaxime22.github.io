import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/presentation/presentation_page.dart';
import 'pages/projects/projects_page.dart';
import 'pages/contact/contact_page.dart';
import 'layout/portfolio_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSavedPage();
  }

  Future<void> _loadSavedPage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentPageIndex = prefs.getInt('currentPageIndex') ?? 0;
    });
  }

  Future<void> _savePage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentPageIndex', index);
  }

  void _navigateToPage(int index) {
    if (index == _currentPageIndex) return;
    
    setState(() {
      _currentPageIndex = index;
    });
    _savePage(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio - Web Version',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D73E2),
          primary: const Color(0xFF8D73E2),
          secondary: const Color(0xFF6451A4),
          error: const Color(0xFFF45866),
          surface: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: PortfolioLayout(
        currentIndex: _currentPageIndex,
        onNavigate: _navigateToPage,
        child: IndexedStack(
          index: _currentPageIndex,
          children: const [
            PresentationPage(),
            ProjectsPage(),
            ContactPage(),
          ],
        ),
      ),
    );
  }
}
