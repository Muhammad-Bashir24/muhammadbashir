import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/project_model.dart';
import '../widgets/footer.dart';

class CaseStudyPage extends StatelessWidget {
  final Project project;

  const CaseStudyPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(project.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Image Placeholder
            Container(
              height: 300,
              width: double.infinity,
              color: AppColors.lightGreen,
              child: project.imagePath != null
                  ? Image.asset(project.imagePath!, fit: BoxFit.cover)
                  : const Center(
                      child: Icon(
                        Icons.architecture,
                        size: 80,
                        color: AppColors.accentGreen,
                      ),
                    ),
            ),

            // Content
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 120,
                vertical: 64,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project.name, style: textTheme.displayMedium),
                  const SizedBox(height: 16),
                  Text(
                    project.role,
                    style: textTheme.titleLarge?.copyWith(
                      color: AppColors.accentGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 48),

                  _sectionHeader(context, 'Overview'),
                  _bodyText(context, project.fullDescription),

                  _sectionHeader(context, 'The Problem'),
                  _bodyText(context, project.problem),

                  _sectionHeader(context, 'The Solution'),
                  _bodyText(context, project.solution),

                  _sectionHeader(context, 'Architecture'),
                  _bodyText(context, project.architecture),

                  _sectionHeader(context, 'Key Features'),
                  ...project.features.map((f) => _bulletItem(context, f)),
                  const SizedBox(height: 48),

                  _sectionHeader(context, 'Technologies'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.technologies
                        .map((t) => _techBadge(context, t))
                        .toList(),
                  ),
                  const SizedBox(height: 48),

                  if (project.challenges.isNotEmpty) ...[
                    _sectionHeader(context, 'Challenges & Solutions'),
                    for (int i = 0; i < project.challenges.length; i++) ...[
                      Text(
                        'Challenge:',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _bodyText(context, project.challenges[i]),
                      Text(
                        'Solution:',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentGreen,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _bodyText(context, project.solutions[i]),
                      const SizedBox(height: 24),
                    ],
                  ],

                  const SizedBox(height: 32),
                  Row(
                    children: [
                      if (project.githubUrl != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(project.githubUrl!),
                            icon: const Icon(Icons.code),
                            label: const Text('View Source'),
                          ),
                        ),
                      if (project.liveUrl != null)
                        OutlinedButton.icon(
                          onPressed: () => _launchUrl(project.liveUrl!),
                          icon: const Icon(Icons.open_in_new),
                          label: const Text('Live Demo'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Footer(
              onNavTap: (section) {
                // Pop the case study page to return to the home page.
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText,
        ),
      ),
    );
  }

  Widget _bodyText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.secondaryText,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _bulletItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 20, color: AppColors.accentGreen),
          ),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.secondaryText,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _techBadge(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.accentGreen,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
