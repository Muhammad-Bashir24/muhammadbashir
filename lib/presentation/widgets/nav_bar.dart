import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../core/responsive/responsive_layout.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavTap;

  const NavBar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      color: AppColors.primaryBackground.withValues(alpha: 0.95),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bashir | Mobile Dev',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.primaryText,
            ),
          ),
          if (!isMobile)
            Row(
              children: [
                _navItem('Home'),
                _navItem('About'),
                _navItem('Skills'),
                _navItem('Experience'),
                _navItem('Projects'),
                _navItem('Services'),
                _navItem('Contact'),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => onNavTap('Contact'),
                  child: const Text('Let\'s Work Together'),
                ),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.primaryText),
              onPressed: () {
                _showMobileMenu(context);
              },
            ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () => onNavTap(title),
        style: TextButton.styleFrom(foregroundColor: AppColors.secondaryText),
        child: Text(
          title,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primaryBackground,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _mobileNavItem(context, 'Home'),
                _mobileNavItem(context, 'About'),
                _mobileNavItem(context, 'Skills'),
                _mobileNavItem(context, 'Experience'),
                _mobileNavItem(context, 'Projects'),
                _mobileNavItem(context, 'Services'),
                _mobileNavItem(context, 'GitHub'),
                _mobileNavItem(context, 'Contact'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _mobileNavItem(BuildContext context, String title) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.primaryText,
        ),
        textAlign: TextAlign.center,
      ),
      onTap: () {
        Navigator.pop(context); // Close the bottom sheet
        onNavTap(title); // Scroll to the section
      },
    );
  }
}
