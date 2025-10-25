import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_data.dart';

class ContactPage extends StatelessWidget {
  final ContactInfo contactInfo;

  const ContactPage({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Feel free to reach out for collaborations or a friendly chat!',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildContactTile(Icons.email, 'Email', contactInfo.email),
          _buildContactTile(Icons.phone, 'Phone', contactInfo.phone),
          _buildContactTile(
            Icons.location_on,
            'Location',
            contactInfo.location,
          ),
          const SizedBox(height: 24),
          Text(
            'Social Links',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSocialButton(
                FontAwesomeIcons.linkedin,
                contactInfo.linkedin,
                Colors.blueAccent,
              ),
              _buildSocialButton(
                FontAwesomeIcons.github,
                contactInfo.github,
                Colors.white,
              ),
              _buildSocialButton(
                FontAwesomeIcons.twitter,
                contactInfo.twitter,
                Colors.lightBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile(IconData icon, String label, String value) {
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.tealAccent),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url, Color color) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri))
          await launchUrl(uri, mode: LaunchMode.externalApplication);
      },
      borderRadius: BorderRadius.circular(50),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color, size: 26),
      ),
    );
  }
}
