import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data/portfolio_config.dart';

class GithubSection extends StatelessWidget {
  const GithubSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.primaryBackground,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.code, size: 48, color: AppColors.accentGreen),
          const SizedBox(height: 24),
          Text(
            'Open Source & Engineering Activity',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Explore my repositories, contributions, and engineering experiments on GitHub.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.secondaryText),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () async {
              final url = Uri.parse(
                PortfolioConfig.socialLinks['GitHub'] ?? '',
              );
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(Icons.open_in_new),
            label: const Text('View GitHub Profile'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryText,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
