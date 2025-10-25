// This file holds all the static data used in the portfolio — like user info, projects, etc.

// Main AppData class that contains all portfolio information.
class AppData {
  // App title shown in the app bar or title.
  static const String appTitle = 'John Doe\'s Portfolio';

  // Static user data object containing details about the user.
  static const UserData user = UserData(
    name: 'Haroon Abbas',
    title: 'Flutter Developer & Mobile Enthusiast',
    bio:
        'Passionate about crafting seamless mobile experiences using Flutter. With a background in computer science, I specialize in cross-platform app development, UI/UX design, and integrating modern tech stacks like Firebase and REST APIs.',
    photoUrl: 'assets/profile.jpg', // Local image in the assets folder.
    skills: [
      'Dart',
      'Flutter',
      'Python',
      'Open AI',
      'SQL',
      'Git',
      'SQLite',
    ],
    education: [
      'Bachelor in Software Engineering - Riphah International University (2022-2026)',
      'Certified Flutter Developer - Cisco(2025)',
    ],
  );

  // List of projects that will be shown on the Projects page.
  static const List<Project> projects = [
    Project(
      title: 'Ai voice assistant',
      description:
          'A feature-rich AI vooice assistant using OPen AI and Python',
      imageUrl: 'assets/todomaster.jpg', // Local image
      technologies: ['Flutter', 'Firebase', 'SQLite'], // Tech used in project
      githubUrl: 'https://github.com/HaroonAbbas12/AI_voice_assistant',
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.example.todomaster',
    ),
    Project(
      title: 'Diabetes Prediction System',
      description:
          'Diabetic Prediction System using Python and google colab',
      imageUrl: 'assets/weatherwise.jpg',
      technologies: ['Flutter', 'REST APIs', 'Geolocator'],
      githubUrl: 'https://github.com/HaroonAbbas12/AI_voice_assistant',
      liveUrl: '',
    ),
    Project(
      title: 'E-Commerce Starter',
      description:
          'A starter e-commerce app with cart management, user authentication, and payment integration (Stripe). Responsive design for mobile and web.',
      imageUrl: 'assets/ecommerce.jpg',
      technologies: ['Flutter', 'Provider', 'Stripe', 'Firebase Auth'],
      githubUrl: 'https://github.com/johndoe/ecommerce_starter',
      liveUrl: '',
    ),
  ];

  // Contact information section.
  static const ContactInfo contactInfo = ContactInfo(
    email: 'haxoonabbas@gmail.com',
    phone: '+923450623909',
    location: 'Islamabad ,Pakistan',
    linkedin: 'https://linkedin.com/in/HaroonAbbas',
    github: 'https://github.com/HaroonAbbas12',
    twitter: 'https://twitter.com/HaroonAbbas',
  );
}

// User data model — contains personal info and education.
class UserData {
  final String name;
  final String title;
  final String bio;
  final String photoUrl;
  final List<String> skills;
  final List<String> education;

  const UserData({
    required this.name,
    required this.title,
    required this.bio,
    required this.photoUrl,
    required this.skills,
    required this.education,
  });
}

// Project data model — used for each project card.
class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String githubUrl;
  final String liveUrl;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.githubUrl,
    required this.liveUrl,
  });
}

// Contact data model — for displaying user’s contact details.
class ContactInfo {
  final String email;
  final String phone;
  final String location;
  final String linkedin;
  final String github;
  final String twitter;

  const ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
    required this.linkedin,
    required this.github,
    required this.twitter,
  });
}
