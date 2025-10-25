// Import Flutter material library
import 'package:flutter/material.dart';

// Import the project data model
import 'app_data.dart';

// ProjectsPage displays a list of project cards
class ProjectsPage extends StatelessWidget {
  final List<Project> projects; // List of projects from AppData

  const ProjectsPage({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ListView.builder is used to create a scrollable list dynamically
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: projects.length, // Number of projects
      itemBuilder: (context, index) {
        final project = projects[index]; // Get each project one by one

        // Card widget for each project
        return Card(
          color: const Color(0xFF1E1E1E), // Dark background for card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Rounded edges
          ),
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 6, // Adds shadow
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display project image from assets
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    project.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 12),

                // Project title
                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent,
                  ),
                ),

                const SizedBox(height: 8),

                // Project description text
                Text(
                  project.description,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),

                const SizedBox(height: 10),

                // Display technologies used as colored chips
                Wrap(
                  spacing: 6.0,
                  children: project.technologies
                      .map<Widget>(
                        (tech) => Chip(
                          label: Text(tech),
                          backgroundColor: Colors.teal.withOpacity(0.2),
                          labelStyle: const TextStyle(color: Colors.tealAccent),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
