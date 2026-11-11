import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/project_model.dart';
import '../widgets/footer.dart';

class CaseStudyPage extends StatelessWidget {
  final Project project;

  const CaseStudyPage({super.key, required this.project});

  Future<void> _launchUrl(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  IconData _getSolutionIcon(int index) {
    switch (index % 4) {
      case 0:
        return Icons.architecture_rounded;
      case 1:
        return Icons.sync_rounded;
      case 2:
        return Icons.shield_outlined;
      default:
        return Icons.check_circle_outline_rounded;
    }
  }

  String _getArchitectureSummary(String architecture) {
    final lower = architecture.toLowerCase();
    if (lower.contains('clean architecture')) {
      return 'Clean Architecture';
    } else if (lower.contains('feature-based') ||
        lower.contains('feature-oriented')) {
      return 'Feature-Oriented';
    } else if (lower.contains('modular')) {
      return 'Modular Architecture';
    } else if (lower.contains('riverpod')) {
      return 'Riverpod Architecture';
    } else if (lower.contains('bloc') || lower.contains('cubit')) {
      return 'BLoC / Cubit';
    } else if (lower.contains('getx')) {
      return 'GetX Architecture';
    } else if (lower.contains('provider')) {
      return 'Provider Pattern';
    } else {
      return 'Mobile Architecture';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final textTheme = Theme.of(context).textTheme;

    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 48.0 : 120.0);

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back to portfolio',
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          isMobile ? 'Case Study' : 'Case Study | ${project.name}',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        actions: [
          if (project.githubUrl != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton.icon(
                onPressed: () => _launchUrl(project.githubUrl!),
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  size: 18,
                  color: AppColors.primaryText,
                ),
                label: Text(
                  isMobile ? 'GitHub' : 'View Source',
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (project.liveUrl != null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton.icon(
                onPressed: () => _launchUrl(project.liveUrl!),
                icon: const Icon(
                  Icons.open_in_new,
                  size: 18,
                  color: AppColors.accentGreen,
                ),
                label: Text(
                  isMobile ? 'Live' : 'Live Demo',
                  style: const TextStyle(
                    color: AppColors.accentGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero / Header Banner
            Container(
              width: double.infinity,
              color: AppColors.lightGreen,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isMobile ? 40 : 64,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _badge(
                        'FEATURED CASE STUDY',
                        AppColors.accentGreen,
                        AppColors.cardBackground,
                      ),
                      if (project.technologies.isNotEmpty)
                        _badge(
                          project.technologies.first.toUpperCase(),
                          AppColors.primaryText,
                          AppColors.cardBackground,
                        ),
                      _badge(
                        project.liveUrl != null
                            ? 'LIVE APPLICATION'
                            : 'PRODUCTION PROJECT',
                        AppColors.accentGreen,
                        AppColors.cardBackground,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    project.name,
                    style: (isMobile
                            ? textTheme.headlineMedium
                            : textTheme.displayMedium)
                        ?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    project.shortDescription,
                    style: (isMobile
                            ? textTheme.titleMedium
                            : textTheme.headlineSmall)
                        ?.copyWith(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Metadata Row
                  Wrap(
                    spacing: 24,
                    runSpacing: 16,
                    children: [
                      _metaItem(
                        icon: Icons.person_outline,
                        label: 'Role',
                        value: project.role,
                      ),
                      _metaItem(
                        icon: Icons.layers_outlined,
                        label: 'Architecture',
                        value: _getArchitectureSummary(project.architecture),
                      ),
                      _metaItem(
                        icon: Icons.code_rounded,
                        label: 'Tech Stack',
                        value: project.technologies.take(3).join(' • '),
                      ),
                      _metaItem(
                        icon: Icons.rocket_launch_outlined,
                        label: 'Status',
                        value: project.liveUrl != null
                            ? 'Live in Production'
                            : 'Shipped Mobile Application',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Optional Disclaimer Banner (for independent exploration studies)
            if (project.id == 'cdcare-reliable-checkout')
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 32,
                ),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFFDE68A),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Color(0xFFD97706),
                      size: 24,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Independent Exploration Disclaimer',
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF92400E),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'This case study and prototype represent an independent concept and engineering exploration conducted by Muhammad Bashir. It is not an official CDcare project, nor is it affiliated with, sponsored by, or endorsed by CDcare.',
                            style: textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF78350F),
                              height: 1.55,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            // Hero Visual / Mockup Showcase
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 32,
              ),
              child: project.imagePath != null
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.borderLight,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            color: AppColors.borderLight.withValues(alpha: 0.4),
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEF4444),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF59E0B),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF10B981),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    '${project.name} • Mobile Interface Showcase',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.secondaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: isMobile ? 260 : 440,
                            ),
                            child: Image.asset(
                              project.imagePath!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: isMobile ? 200 : 280,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.lightGreen,
                            AppColors.borderLight.withValues(alpha: 0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.borderLight,
                          width: 1.5,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.devices_rounded,
                                  size: 44,
                                  color: AppColors.accentGreen,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                '${project.name} Interface & Architecture',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Cross-platform mobile application engineered by Muhammad Bashir',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 14,
                            right: 14,
                            child: _placeholderTag('Mobile Product Showcase'),
                          ),
                        ],
                      ),
                    ),
            ),

            // Main Content Body
            Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Overview
                  _sectionHeader(context, '1. Overview'),
                  _bodyText(context, project.fullDescription),

                  // Quick Stats / Highlights Grid
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final cols = isMobile ? 2 : 4;
                      return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: cols,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: isMobile ? 1.5 : 1.8,
                        children: [
                          _statCard(
                            context,
                            '${project.technologies.length}+',
                            'Technologies & Tools',
                          ),
                          _statCard(
                            context,
                            '${project.features.length}',
                            'Key Features Shipped',
                          ),
                          _statCard(
                            context,
                            project.technologies.isNotEmpty
                                ? project.technologies.first
                                : 'Flutter',
                            'Core Technology',
                          ),
                          _statCard(
                            context,
                            project.liveUrl != null ? 'Live' : 'Production',
                            'Deployment Status',
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 48),

                  // 2. The Problem
                  _sectionHeader(context, '2. The Problem'),
                  _bodyText(context, project.problem),

                  // 3. The Solution
                  _sectionHeader(context, '3. The Solution'),
                  _bodyText(context, project.solution),

                  if (project.solutions.isNotEmpty) ...[
                    for (int i = 0; i < project.solutions.length; i++)
                      _solutionPillar(
                        context,
                        icon: _getSolutionIcon(i),
                        title: 'Solution Strategy ${i + 1}',
                        description: project.solutions[i],
                      ),
                    const SizedBox(height: 32),
                  ],

                  // 4. Key Features
                  _sectionHeader(context, '4. Key Features'),
                  ...project.features.map((f) => _bulletItem(context, f)),
                  const SizedBox(height: 48),

                  // 5. Architecture & Technical Implementation
                  _sectionHeader(
                    context,
                    '5. Architecture & Technical Implementation',
                  ),
                  _bodyText(
                    context,
                    'The application is engineered with an emphasis on maintainability, scalability, and robust state management:',
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'System Architecture & Engineering Highlights',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _techPillRow('Architecture', project.architecture),
                        const Divider(height: 24),
                        _techPillRow('Engineering Role', project.role),
                        const Divider(height: 24),
                        _techPillRow(
                          'Core Tech Stack',
                          project.technologies.join(' • '),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  _sectionHeader(context, 'Technologies Used'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.technologies
                        .map((t) => _techBadge(context, t))
                        .toList(),
                  ),
                  const SizedBox(height: 48),

                  // 6. Engineering Challenges & Solutions (if available)
                  if (project.challenges.isNotEmpty) ...[
                    _sectionHeader(
                      context,
                      '6. Engineering Challenges & Solutions',
                    ),
                    for (int i = 0; i < project.challenges.length; i++)
                      _challengeSolutionCard(
                        context,
                        index: i + 1,
                        challenge: project.challenges[i],
                        solution: i < project.solutions.length
                            ? project.solutions[i]
                            : null,
                      ),
                    const SizedBox(height: 32),
                  ],

                  // 7. Project Availability & Source Section
                  _sectionHeader(
                    context,
                    project.challenges.isNotEmpty
                        ? '7. Project Availability & Links'
                        : '6. Project Availability & Links',
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.accentGreen.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              project.githubUrl != null
                                  ? FontAwesomeIcons.github
                                  : FontAwesomeIcons.mobileScreenButton,
                              size: 32,
                              color: AppColors.primaryText,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project.name,
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    project.liveUrl ??
                                        project.githubUrl ??
                                        'Production Mobile Application',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          project.shortDescription,
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.secondaryText,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 16,
                          runSpacing: 12,
                          children: [
                            if (project.githubUrl != null)
                              ElevatedButton.icon(
                                onPressed: () => _launchUrl(project.githubUrl!),
                                icon: const FaIcon(
                                  FontAwesomeIcons.github,
                                  size: 16,
                                ),
                                label: const Text('View Source on GitHub'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accentGreen,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                ),
                              ),
                            if (project.liveUrl != null)
                              ElevatedButton.icon(
                                onPressed: () => _launchUrl(project.liveUrl!),
                                icon: const Icon(Icons.open_in_new, size: 16),
                                label: const Text('Visit Live Application'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accentGreen,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                ),
                              ),
                            if (project.githubUrl == null &&
                                project.liveUrl == null)
                              OutlinedButton.icon(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.arrow_back, size: 16),
                                label: const Text('Back to All Projects'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
                ],
              ),
            ),

            // Footer
            Footer(
              onNavTap: (section) {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper UI Components Matching CDcare Styling ---

  Widget _badge(String text, Color fgColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: fgColor.withValues(alpha: 0.2)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: fgColor,
          fontWeight: FontWeight.bold,
          fontSize: 11,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _metaItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 260),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, size: 18, color: AppColors.accentGreen),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                  letterSpacing: -0.5,
                ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 48,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.accentGreen,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.secondaryText,
              height: 1.65,
            ),
      ),
    );
  }

  Widget _statCard(BuildContext context, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.accentGreen.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentGreen,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _solutionPillar(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.accentGreen, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondaryText,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bulletItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(
              Icons.check_circle_outline_rounded,
              color: AppColors.accentGreen,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.secondaryText,
                    height: 1.55,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _techPillRow(String label, String detail) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Text(
            detail,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ],
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

  Widget _challengeSolutionCard(
    BuildContext context, {
    required int index,
    required String challenge,
    String? solution,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderLight, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Challenge Row
            Container(
              padding: const EdgeInsets.all(18),
              color: const Color(0xFFFEF3C7).withValues(alpha: 0.35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD97706),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'CHALLENGE $index',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      challenge,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryText,
                            height: 1.5,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.borderLight),
            // Solution Row
            if (solution != null)
              Container(
                padding: const EdgeInsets.all(18),
                color: AppColors.lightGreen.withValues(alpha: 0.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accentGreen,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'SOLUTION',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        solution,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.secondaryText,
                              height: 1.5,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _placeholderTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
