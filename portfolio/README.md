# 🧑‍💻 Flutter Portfolio App

A **beginner-friendly Flutter portfolio** app that displays your personal information, skills, education, and projects — built with simple and clean UI components.

---

## 🚀 Features
- Clean dark theme design  
- Local asset images  
- Simple navigation using BottomNavigationBar  
- Animated intro with Lottie animation  
- Organized data using model classes  

---

## 🧩 Folder Structure

lib/
 main.dart → Entry point of the app
 <br>
 portfolio_home.dart → Main screen with bottom navigation
 <br>
 app_data.dart → Contains all data (bio, skills, projects)
 <br>
 home_page.dart → Displays profile photo, name, and bio
 <br>
 about_page.dart → Displays skills and education
 <br>
 projects_page.dart → Shows project cards
 <br>
 contact_page.dart → (Optional) Displays contact info


 
---

## 🧱 Widgets Used and Why
| Widget | Purpose |
|---------|----------|
| **MaterialApp** | Root of the Flutter app, controls theme and navigation |
| **Scaffold** | Provides base structure with body and navigation bar |
| **BottomNavigationBar** | Allows switching between screens easily |
| **SingleChildScrollView** | Makes long content scrollable |
| **Column** | Arranges items vertically |
| **ListView.builder** | Efficiently renders multiple project cards |
| **Card** | Displays projects in a nice container with shadow |
| **CircleAvatar** | Displays profile image in a circular frame |
| **Text** | Displays text everywhere |
| **Wrap + Chip** | Nicely arrange and display skill tags |
| **ClipRRect + Image.asset** | Rounded corners for project images |
| **Lottie** | Adds animated intro from LottieFiles |

---

## ⚙️ How to Run
1. **Clone or download** the project.
2. Open in **VS Code** or **Android Studio**.
3. Make sure your `pubspec.yaml` includes:
   ```yaml
   flutter:
     uses-material-design: true
     assets:
       - assets/profile.jpg
       - assets/todomaster.jpg
       - assets/weatherwise.jpg
       - assets/ecommerce.jpg





🧠 How It Works

The app starts in main.dart → loads PortfolioHome.

PortfolioHome uses a bottom navigation bar to switch between pages.

Each page (Home, About, Projects, Contact) gets its data from AppData.

The UI is created using simple Flutter widgets — ideal for beginners to learn structure and styling.

💡 Beginner Tips

You can replace all personal data inside app_data.dart with your own info.

Add or remove skills and projects easily by editing the lists.

Try changing the color theme by modifying the seed color in main.dart.

🧑‍🎓 Summary

This project is perfect for beginners learning Flutter, covering:

Data organization using model classes

Navigation using BottomNavigationBar

Styling with themes

Displaying images and animations

Using ListView, Column, and Wrap widgets effectively




---

✅ **Now your entire Flutter portfolio app is fully commented and documented.**

Would you like me to include a `contact_page.dart` file too (simple version with email, GitHub, LinkedIn, etc.) — so it completes all 4 tabs?
