import 'package:flutter/material.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_colors.dart';

class EngineeringPhilosophySection extends StatelessWidget {
  const EngineeringPhilosophySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    final steps = [
      {
        'number': '01',
        'title': 'Understand',
        'desc': 'Understand the product, users and requirements.',
      },
      {
        'number': '02',
        'title': 'Architect',
        'desc': 'Design maintainable and scalable application architecture.',
      },
      {
        'number': '03',
        'title': 'Build',
        'desc': 'Implement clean, reusable and production-ready features.',
      },
      {
        'number': '04',
        'title': 'Test',
        'desc': 'Test functionality, edge cases and reliability.',
      },
      {
        'number': '05',
        'title': 'Optimize',
        'desc': 'Improve performance, UX and maintainability.',
      },
      {
        'number': '06',
        'title': 'Ship',
        'desc': 'Prepare and deploy the application to production.',
      },
    ];

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
          Text('How I Build', style: Theme.of(context).textTheme.displayMedium),
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
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile
                  ? 1
                  : (ResponsiveLayout.isTablet(context) ? 2 : 3);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: isMobile ? 2.0 : 1.5,
                ),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  final step = steps[index];
                  return Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step['number']!,
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(
                                color: AppColors.accentGreen.withValues(
                                  alpha: 0.5,
                                ),
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          step['title']!,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            step['desc']!,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.secondaryText),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
