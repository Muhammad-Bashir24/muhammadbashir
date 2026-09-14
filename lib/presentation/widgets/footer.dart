import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data/portfolio_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final Function(String) onNavTap;

  const Footer({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    // final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.primaryBackground,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          Text(
            PortfolioConfig.name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            PortfolioConfig.title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _footerLink('Home'),
              _footerLink('About'),
              _footerLink('Projects'),
              _footerLink('Contact'),
              _footerLink('GitHub'),
              _footerLink('LinkedIn'),
            ],
          ),
          const SizedBox(height: 48),
          Text(
            '© ${DateTime.now().year} ${PortfolioConfig.name}. All rights reserved.',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.secondaryText),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String title) {
    return TextButton(
      onPressed: () async {
        if (title == 'LinkedIn') {
          final url = Uri.parse(PortfolioConfig.socialLinks['LinkedIn'] ?? '');
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        } else {
          onNavTap(title);
        }
      },
      style: TextButton.styleFrom(foregroundColor: AppColors.primaryText),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}
