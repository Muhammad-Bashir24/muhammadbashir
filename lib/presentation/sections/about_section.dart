import 'package:flutter/material.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data/portfolio_config.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About Me', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 16),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.accentGreen,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 48),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 3,
                child: Text(
                  PortfolioConfig.aboutMe,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.8,
                    color: AppColors.secondaryText,
                  ),
                ),
              ),
              if (!isMobile) const SizedBox(width: 64),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Container(
                  margin: EdgeInsets.only(top: isMobile ? 48 : 0),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderLight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What I Focus On',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _focusItem(
                        context,
                        'Clean Architecture',
                        Icons.architecture,
                      ),
                      _focusItem(
                        context,
                        'Scalable Applications',
                        Icons.auto_graph,
                      ),
                      _focusItem(
                        context,
                        'Great User Experience',
                        Icons.touch_app,
                      ),
                      _focusItem(context, 'Performance', Icons.speed),
                      _focusItem(
                        context,
                        'Production Reliability',
                        Icons.security,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _focusItem(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.accentGreen, size: 20),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
