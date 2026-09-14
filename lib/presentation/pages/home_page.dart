import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/engineering_philosophy_section.dart';
import '../sections/services_section.dart';
import '../sections/github_section.dart';
import '../sections/contact_section.dart';
import '../../core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, GlobalKey> _keys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Experience': GlobalKey(),
    'Projects': GlobalKey(),
    'Services': GlobalKey(),
    'GitHub': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void _scrollToSection(String section) {
    final key = _keys[section];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Column(
        children: [
          NavBar(onNavTap: _scrollToSection),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    key: _keys['Home'],
                    child: HeroSection(onNavTap: _scrollToSection),
                  ),
                  Container(key: _keys['About'], child: const AboutSection()),
                  Container(key: _keys['Skills'], child: const SkillsSection()),
                  Container(
                    key: _keys['Experience'],
                    child: const ExperienceSection(),
                  ),
                  Container(
                    key: _keys['Projects'],
                    child: const ProjectsSection(),
                  ),
                  const EngineeringPhilosophySection(),
                  Container(
                    key: _keys['Services'],
                    child: const ServicesSection(),
                  ),
                  Container(key: _keys['GitHub'], child: const GithubSection()),
                  Container(
                    key: _keys['Contact'],
                    child: const ContactSection(),
                  ),
                  Footer(onNavTap: _scrollToSection),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
