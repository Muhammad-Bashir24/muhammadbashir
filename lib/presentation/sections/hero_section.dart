import 'package:flutter/material.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data/portfolio_config.dart';

class HeroSection extends StatelessWidget {
  final Function(String) onNavTap;

  const HeroSection({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: isMobile ? 64 : 120,
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isMobile ? 0 : 3,
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  PortfolioConfig.name,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: isMobile ? 40 : 64,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 8),
                Text(
                  PortfolioConfig.title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.accentGreen,
                    fontSize: isMobile ? 24 : 32,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 24),
                Text(
                  PortfolioConfig.headline,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isMobile ? 16 : 20,
                    height: 1.5,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 48),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: isMobile
                      ? WrapAlignment.center
                      : WrapAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () => onNavTap('Projects'),
                      child: const Text('View My Work'),
                    ),
                    OutlinedButton(
                      onPressed: () => onNavTap('Contact'),
                      child: const Text('Let\'s Work Together'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 48),
          if (!isMobile)
            Expanded(
              flex: 2,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: const Center(
                  child: Icon(
                    Icons.phone_iphone_rounded,
                    size: 120,
                    color: AppColors.accentGreen,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
