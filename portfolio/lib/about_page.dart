// Import Flutter's material design library
import 'package:flutter/material.dart';

// Import app data that holds user info
import 'app_data.dart';

// AboutPage shows information about the user (bio, skills, education)
class AboutPage extends StatelessWidget {
  final UserData userData; // Holds user data passed from AppData

  const AboutPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    // Makes screen scrollable if content overflows
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0), // Adds padding around content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
        children: [
          // Title of the section
          Text(
            'About Me',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20), // Adds vertical space
          // Display the bio text from user data
          Text(userData.bio, style: const TextStyle(fontSize: 16, height: 1.6)),

          const SizedBox(height: 30),

          // Section title for Skills
          Text(
            'Skills',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          // Wrap widget arranges skill chips nicely across lines
          Wrap(
            spacing: 8, // Horizontal space between chips
            runSpacing: 8, // Vertical space between lines of chips
            children: userData.skills
                .map<Widget>(
                  (skill) => Chip(
                    label: Text(skill), // Show skill text
                    backgroundColor: Colors.tealAccent.withOpacity(0.1),
                    labelStyle: const TextStyle(color: Colors.tealAccent),
                  ),
                )
                .toList(), // Converts list of skills to list of Chip widgets
          ),

          const SizedBox(height: 30),

          // Section title for Education
          Text(
            'Education',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // Maps through education list and displays each with a bullet
          ...userData.education.map(
            (edu) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('• $edu', style: const TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
