import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Showcase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.jpg'), // Add your profile picture
            ),
            SizedBox(height: 10),
            Text(
              'Om Shandilya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Flutter Developer | Mobile App Enthusiast',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(title: 'About Me'),
                      Text(
                        'Passionate Flutter developer with experience in building aesthetic and functional mobile applications. Skilled in creating responsive UI, managing state, and integrating APIs.',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      SizedBox(height: 20),
                      SectionHeader(title: 'Skills'),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          SkillChip(skill: 'Flutter'),
                          SkillChip(skill: 'Dart'),
                          SkillChip(skill: 'Firebase'),
                          SkillChip(skill: 'SQL'),
                          SkillChip(skill: 'REST APIs'),
                          SkillChip(skill: 'Spring Boot'),
                          SkillChip(skill: 'PostgreSQL'),
                          SkillChip(skill: 'Java'),
                          SkillChip(skill: 'Kotlin'),
                          SkillChip(skill: 'C/C++'),
                          SkillChip(skill: 'Python'),
                          SkillChip(skill: 'Data Structure Algorithms'),
                        ],
                      ),
                      SizedBox(height: 20),
                      SectionHeader(title: 'Experience'),
                      ExperienceItem(
                          title: 'Mobile App Intern',
                          company: 'CRIS',
                          duration: 'May 2024 - June 2024',
                          description: 'Assisted in designing and developing their internal Cab Service applications using Flutter.'
                      ),
                      SizedBox(height: 20),
                      SectionHeader(title: 'Projects'),
                      ProjectItem(
                        title: 'Shop All',
                        technologies: 'Flutter, Spring Boot, PostgreSQL',
                        duration: '29 September - Present',
                        description: [
                          'Developed a full-stack E-Commerce application using Spring Boot serving a REST API with Flutter as the frontend.',
                          'Implemented Payment gateway via Razor Pay.',
                          'Implemented Cart and Product List UI using bloc architecture.',
                          'Leveraged API from fakestoreapi to present the product list with images.',
                          'Real-time current location tracking for delivery.'
                        ],
                      ),
                      SizedBox(height: 10),
                      ProjectItem(
                        title: 'Hospital Management Application',
                        technologies: 'Flutter, Spring Boot, PostgreSQL',
                        duration: '30 July - 17 September',
                        description: [
                          'Built a full-stack application using a Flutter frontend and Spring Boot backend, integrating PostgreSQL for reliable data storage.',
                          'Designed and implemented role-based navigation for Admin, Doctor, and Patient dashboards, improving user experience.',
                          'Created and integrated RESTful APIs for user management, appointment scheduling, and history tracking.',
                          'Enabled full CRUD capabilities for patient, doctor, and admin data, allowing dynamic updates and improved app usability.'
                        ],
                      ),
                      SizedBox(height: 20),
                      SectionHeader(title: 'Contact'),
                      ContactInfo(icon: Icons.email, text: 'omshandilya.work@gmail.com'),
                      ContactInfo(icon: Icons.phone, text: '9910560920'),
                      ContactInfo(icon: Icons.web, text: 'https://github.com/omshandilya'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.blue[50],
      labelStyle: TextStyle(color: Colors.blue),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String duration;
  final String description;

  ExperienceItem({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$company | $duration',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatefulWidget {
  final String title;
  final String technologies;
  final String duration;
  final List<String> description;

  ProjectItem({
    required this.title,
    required this.technologies,
    required this.duration,
    required this.description,
  });

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _isHovered = true;
        }),
        onExit: (_) => setState(() {
          _isHovered = false;
        }),
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: Duration(milliseconds: 200),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${widget.technologies} | ${widget.duration}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5),
                  ...widget.description.map(
                        (desc) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text('• $desc', style: TextStyle(fontSize: 16)),
                    ),
                  ).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  ContactInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
