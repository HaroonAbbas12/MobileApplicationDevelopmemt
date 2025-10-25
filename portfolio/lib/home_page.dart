// Importing required Flutter packages and files.
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // For animated vector graphics.
import 'app_data.dart'; // Importing our app data (user info, etc.)

// HomePage widget shows profile picture, name, title, and bio.
class HomePage extends StatelessWidget {
  final UserData userData; // The user data passed from AppData.

  const HomePage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView makes content scrollable on small screens.
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20), // Adds empty space above.
          // Displays an animation from Lottie (network source).
          Lottie.network(
            'https://assets9.lottiefiles.com/packages/lf20_1pxqjqps.json',
            width: 180,
            repeat: true,
          ),

          const SizedBox(height: 10),

          // CircleAvatar widget to show profile photo.
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              userData.photoUrl,
            ), // Using asset image now.
          ),

          const SizedBox(height: 16),

          // Displaying user's name in a large, bold font.
          Text(
            userData.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent,
            ),
          ),

          const SizedBox(height: 8),

          // Displaying the user's professional title.
          Text(
            userData.title,
            style: TextStyle(fontSize: 16, color: Colors.grey[400]),
          ),

          const SizedBox(height: 20),

          // Displaying short bio/description.
          Text(
            userData.bio,
            style: const TextStyle(fontSize: 15, height: 1.6),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
