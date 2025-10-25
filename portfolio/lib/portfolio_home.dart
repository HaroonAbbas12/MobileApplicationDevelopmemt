// Importing Flutter Material library
import 'package:flutter/material.dart';

// Importing all the different page widgets and app data
import 'app_data.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'projects_page.dart';
import 'contact_page.dart';

// PortfolioHome is the main navigation screen with bottom navigation
class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int _currentIndex = 0; // Keeps track of which tab is active

  // List of all pages (screens)
  final List<Widget> _pages = [
    HomePage(userData: AppData.user),
    AboutPage(userData: AppData.user),
    ProjectsPage(projects: AppData.projects),
    ContactPage(contactInfo: AppData.contactInfo),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Displays selected page
      // Bottom navigation bar to switch between screens
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // Current selected tab index
        selectedItemColor: Colors.blue[800], // Active icon color
        unselectedItemColor: Colors.grey, // Inactive icon color
        // When a tab is tapped, update the index and rebuild
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        // Define all bottom navigation items
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
