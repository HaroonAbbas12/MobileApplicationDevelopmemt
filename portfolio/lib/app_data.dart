// This file holds all the static data used in the portfolio — like user info, projects, etc.

// Main AppData class that contains all portfolio information.
class AppData {
  // App title shown in the app bar or title.
  static const String appTitle = 'John Doe\'s Portfolio';

  // Static user data object containing details about the user.
  static const UserData user = UserData(
    name: 'John Doe',
    title: 'Flutter Developer & Mobile Enthusiast',
    bio:
        'Passionate about crafting seamless mobile experiences using Flutter. With a background in computer science, I specialize in cross-platform app development, UI/UX design, and integrating modern tech stacks like Firebase and REST APIs.',
    photoUrl: 'assets/profile.jpg', // Local image in the assets folder.
    skills: [
      'Dart',
      'Flutter',
      'Firebase',
      'REST APIs',
      'State Management (Provider/Riverpod)',
      'Git',
      'SQLite',
    ],
    education: [
      'Bachelor of Science in Computer Science - University of Example (2020-2024)',
      'Certified Flutter Developer - Google (2023)',
    ],
  );

  // List of projects that will be shown on the Projects page.
  static const List<Project> projects = [
    Project(
      title: 'TodoMaster Pro',
      description:
          'A feature-rich todo list app with offline support, reminders, and cloud sync using Firebase. Built with Flutter for iOS and Android.',
      imageUrl: 'assets/todomaster.jpg', // Local image
      technologies: ['Flutter', 'Firebase', 'SQLite'], // Tech used in project
      githubUrl: 'https://github.com/johndoe/todomaster',
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.example.todomaster',
    ),
    Project(
      title: 'WeatherWise',
      description:
          'Real-time weather forecasting app integrating OpenWeatherMap API. Includes location-based forecasts, hourly updates, and a clean Material Design UI.',
      imageUrl: 'assets/weatherwise.jpg',
      technologies: ['Flutter', 'REST APIs', 'Geolocator'],
      githubUrl: 'https://github.com/johndoe/weatherwise',
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
    email: 'john.doe@example.com',
    phone: '+1 234 567 8900',
    location: 'New York, NY, USA',
    linkedin: 'https://linkedin.com/in/johndoe',
    github: 'https://github.com/johndoe',
    twitter: 'https://twitter.com/johndoe',
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
