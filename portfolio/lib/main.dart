// Importing the Flutter material package which gives access to UI widgets.
import 'package:flutter/material.dart';

// Importing our custom portfolio home screen.
import 'portfolio_home.dart';

// The main function is the entry point of every Dart/Flutter app.
void main() {
  // runApp() starts the Flutter app and takes a widget as its argument.
  runApp(const MyApp());
}

// This is the root widget of the application.
class MyApp extends StatelessWidget {
  // Constructor with a constant key for optimization.
  const MyApp({super.key});

  // The build method describes how the UI should look.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Removes the debug banner from the top.
      themeMode: ThemeMode.dark, // Forces the app to use dark theme mode.
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        // Customizing the color theme
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.tealAccent, // Base color for the theme.
          brightness:
              Brightness.dark, // Makes sure all elements use dark mode colors.
        ),
        scaffoldBackgroundColor: const Color(
          0xFF121212,
        ), // Background color of all screens.
        cardColor: const Color(0xFF1E1E1E), // Background color of cards.
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, // Transparent app bar.
          elevation: 0, // Removes shadow under the app bar.
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      // The home property defines the first screen of the app.
      home: const PortfolioHome(),
    );
  }
}
