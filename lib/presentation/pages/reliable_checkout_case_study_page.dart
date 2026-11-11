import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/footer.dart';

class ReliableCheckoutCaseStudyPage extends StatelessWidget {
  const ReliableCheckoutCaseStudyPage({super.key});

  static const String _githubRepoUrl =
      'https://github.com/Muhammad-Bashir24/cdcare';

  Future<void> _launchUrl(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
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
          isMobile ? 'Case Study' : 'Case Study | Reliable Mobile Checkout',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton.icon(
              onPressed: () => _launchUrl(_githubRepoUrl),
              icon: const FaIcon(
                FontAwesomeIcons.github,
                size: 18,
                color: AppColors.primaryText,
              ),
              label: Text(
                isMobile ? 'GitHub' : 'View on GitHub',
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w600,
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
                        'INDEPENDENT FLUTTER CASE STUDY',
                        AppColors.accentGreen,
                        AppColors.cardBackground,
                      ),
                      _badge(
                        'RIVERPOD',
                        AppColors.primaryText,
                        AppColors.cardBackground,
                      ),
                      _badge(
                        '29 AUTOMATED TESTS',
                        AppColors.accentGreen,
                        AppColors.cardBackground,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Reliable Mobile Checkout',
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
                    'Defensive UX, State Management & Resilient Address Submission in Flutter',
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
                        value: 'Mobile Engineer (Independent Exploration)',
                      ),
                      _metaItem(
                        icon: Icons.layers_outlined,
                        label: 'Architecture',
                        value: 'Feature-Oriented with Riverpod',
                      ),
                      _metaItem(
                        icon: Icons.checklist_outlined,
                        label: 'Testing',
                        value: '29 Unit & Widget Tests Passed',
                      ),
                      _metaItem(
                        icon: Icons.code_rounded,
                        label: 'Source',
                        value: 'Open Source Prototype',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Mandatory Disclaimer Banner
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 32,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBEB), // Soft warm amber tint
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
                          'This case study and prototype represent an independent concept and engineering exploration conducted by Muhammad Bashir. It is not an official CDcare project, nor is it affiliated with, sponsored by, or endorsed by CDcare. This project does not claim a verified production defect in CDcare\'s applications, nor does it claim verified conversion improvements. All observations and implementations reflect independent research into defensive mobile checkout engineering.',
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

            // Main Content Body
            Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Overview
                  _sectionHeader(context, '1. Overview'),
                  _bodyText(
                    context,
                    'In mobile commerce, the checkout and address-submission flow is the single most critical transition point in the user journey. Any friction, unresponsiveness, or perpetual loading state at this stage introduces uncertainty, triggers duplicate submissions, and risks user abandonment.\n\n'
                    'This independent Flutter case study focuses on defensive UX engineering and resilient state management during checkout address submission. By modeling deterministic state transitions, handling failure modes explicitly, and guaranteeing non-destructive retries, the prototype illustrates how mobile applications can maintain trust even when network conditions degrade.',
                  ),

                  // Quick Stats / Highlights
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
                          _statCard(context, '29', 'Automated Tests Passed'),
                          _statCard(context, 'Riverpod', 'Reactive Architecture'),
                          _statCard(context, '100%', 'Form State Preserved'),
                          _statCard(context, '0s', 'Indeterminate Loading'),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 48),

                  // 2. Problem Observed
                  _sectionHeader(context, '2. Problem Observed'),
                  _bodyText(
                    context,
                    'While independently exploring mobile commerce applications—specifically the address-submission flow in CDcare\'s app—an address-submission request appeared to remain in an indeterminate loading state without explicit user feedback, a progress timeout, or an actionable error recovery option.\n\n'
                    'Root Cause Context & Scope:\n'
                    'As an external explorer without access to CDcare\'s codebase, server logs, or telemetry, the underlying cause could not be verified (whether attributable to transient network dropouts, API gateway latency, payload parsing, or client timeout configuration). Furthermore, it is unknown whether this condition affects other users or devices.\n\n'
                    'The Engineering Challenge in Checkout Flows:\n'
                    '• Indeterminate Spinners: When a loading indicator spins indefinitely, users are left uncertain whether their order was processed or their address saved.\n'
                    '• Duplicate Submissions: Users frequently tap submit repeatedly in frustration, triggering duplicate requests and potential race conditions.\n'
                    '• Input Wiping on Failure: Conventional form implementations frequently reset inputs upon error, forcing users to re-enter complex address and contact details.',
                  ),

                  // 3. Proposed Solution
                  _sectionHeader(context, '3. Proposed Solution'),
                  _bodyText(
                    context,
                    'To address these failure modes systematically, I designed and developed a standalone Flutter prototype built on defensive user experience principles and deterministic state management:',
                  ),
                  _solutionPillar(
                    context,
                    icon: Icons.sync_problem_rounded,
                    title: 'Deterministic State Machine',
                    description:
                        'Replaced vague boolean flags with a structured state machine: Idle, Validating, Submitting, Recoverable Failure (with typed reasons), and Success.',
                  ),
                  _solutionPillar(
                    context,
                    icon: Icons.timer_outlined,
                    title: 'Enforced 10-Second Timeouts',
                    description:
                        'Network operations are governed by strict timeout bounds. If a response is delayed beyond 10 seconds, the flow terminates gracefully into a retryable failure rather than hanging indefinitely.',
                  ),
                  _solutionPillar(
                    context,
                    icon: Icons.save_as_outlined,
                    title: 'Non-Destructive Error Recovery',
                    description:
                        'Form field values are decoupled from transient submission states and preserved 100% in memory. Upon an error, the user receives actionable feedback and a single-tap "Retry" button.',
                  ),
                  _solutionPillar(
                    context,
                    icon: Icons.shield_outlined,
                    title: 'Idempotency & Duplicate Request Guard',
                    description:
                        'The submission trigger immediately locks the UI, disabling repeat taps and in-flight submissions to prevent race conditions.',
                  ),
                  const SizedBox(height: 48),

                  // 4. Key Features
                  _sectionHeader(context, '4. Key Features'),
                  _bulletItem(
                    context,
                    'Address Validation: Real-time inline validation ensuring required fields, valid phone formatting, and state selection are complete before submission.',
                  ),
                  _bulletItem(
                    context,
                    'Explicit Loading States: Animated progress indicator with contextual messaging ("Validating address details...") preventing repeated user taps.',
                  ),
                  _bulletItem(
                    context,
                    'Simulated Failure Bench: Built-in failure mode simulator allowing testers to inject timeouts, network drops, and 500 server errors on demand.',
                  ),
                  _bulletItem(
                    context,
                    'Resilient Error Recovery: Contextual bottom banners with clear explanations and a 1-tap retry mechanism that retains all previously entered data.',
                  ),
                  _bulletItem(
                    context,
                    'Order Progression & Success Confirmation: Smooth, seamless transition from address confirmation to checkout summary.',
                  ),
                  _bulletItem(
                    context,
                    'Feature-Oriented Architecture: Clean separation of concerns facilitating maintainability and testability.',
                  ),
                  const SizedBox(height: 48),

                  // 5. Technical Implementation
                  _sectionHeader(context, '5. Technical Implementation'),
                  _bodyText(
                    context,
                    'The prototype is built with modern Flutter engineering best practices, leveraging Riverpod for compile-safe, testable state management without coupling logic to Flutter\'s BuildContext.',
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
                          'Architecture & Layer Breakdown',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _techPillRow('Presentation Layer',
                            'CheckoutAddressScreen, AddressFormWidget, LoadingOverlay, and ErrorBanner widgets reacting to Riverpod state.'),
                        const Divider(height: 24),
                        _techPillRow('Application / State',
                            'CheckoutStateNotifier managing immutable CheckoutState (idle, loading, failure, success) and form data retention.'),
                        const Divider(height: 24),
                        _techPillRow('Domain Layer',
                            'Address entity, validation rules, and CheckoutFailure union types (network, timeout, serverError).'),
                        const Divider(height: 24),
                        _techPillRow('Data / Simulation Layer',
                            'MockCheckoutRepository with configurable latency injection, fault triggers, and simulated response payloads.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  _sectionHeader(context, 'Technologies Used'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _techBadge(context, 'Flutter'),
                      _techBadge(context, 'Dart'),
                      _techBadge(context, 'Riverpod (StateNotifier)'),
                      _techBadge(context, 'Feature-Oriented Architecture'),
                      _techBadge(context, 'Automated Testing (Unit & Widget)'),
                      _techBadge(context, 'Resilient Network Simulation'),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // 6. Testing Suite
                  _sectionHeader(context, '6. Testing (29 Tests Passed)'),
                  _bodyText(
                    context,
                    'Quality assurance is central to defensive UX. The prototype is backed by an automated test suite comprising 29 tests verifying every state transition, failure recovery pathway, and form edge case.',
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.accentGreen.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentGreen.withValues(alpha: 0.05),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.check_circle_rounded,
                                color: AppColors.accentGreen,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Automated Test Suite Status: 29 / 29 Passing',
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                  Text(
                                    '100% pass rate across unit, widget, and flow tests',
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
                        _testCategory(
                          context,
                          title: 'Unit Tests (14 Tests)',
                          detail:
                              'Covers address field validation (empty input, invalid phone format, missing state), state machine transitions, failure serialization, and input preservation.',
                        ),
                        const SizedBox(height: 12),
                        _testCategory(
                          context,
                          title: 'Widget Tests (10 Tests)',
                          detail:
                              'Verifies form rendering, inline error triggers on blur/submit, disabled submission button during in-flight requests, and error banner rendering.',
                        ),
                        const SizedBox(height: 12),
                        _testCategory(
                          context,
                          title: 'Integration & Flow Tests (5 Tests)',
                          detail:
                              'Simulates full user flows: Fill address -> Submit -> Simulated Timeout -> Tap Retry -> Preserved Form -> Success screen rendered.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // 7. Screenshots & Demo (Placeholders)
                  _sectionHeader(context, '7. Screenshots & Demo'),
                  _bodyText(
                    context,
                    'Visual demonstration of the prototype in action. The placeholders below represent the video walkthrough and key application states:',
                  ),

                  // Demo Video Placeholder Card
                  Container(
                    width: double.infinity,
                    height: isMobile ? 220 : 360,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B), // Dark slate
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderLight),
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
                                color: Colors.white.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                size: 54,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'DEMO VIDEO PLACEHOLDER',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'Video Walkthrough: Address Submission, Simulated Timeout & Retry\n(Add video asset to assets/images/ or embed external player)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.75),
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: _placeholderTag('Asset Placeholder'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Screenshots Grid (3 columns on desktop, 1 on mobile)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final cols = isMobile ? 1 : (isTablet ? 2 : 3);
                      return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: cols,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: isMobile ? 1.4 : 0.85,
                        children: [
                          _screenshotPlaceholder(
                            context,
                            stepBadge: 'STEP 1',
                            title: 'Address Form & Live Validation',
                            filePath: 'assets/images/cdcare_address_form.png',
                            description:
                                'Real-time field validation, Nigerian phone format checks, and disabled submission state until valid.',
                            icon: Icons.edit_note_rounded,
                          ),
                          _screenshotPlaceholder(
                            context,
                            stepBadge: 'STEP 2',
                            title: 'Simulated Failure & Retry State',
                            filePath: 'assets/images/cdcare_error_retry.png',
                            description:
                                'Timeout / connection failure prompt with one-tap retry while preserving 100% of form inputs.',
                            icon: Icons.error_outline_rounded,
                          ),
                          _screenshotPlaceholder(
                            context,
                            stepBadge: 'STEP 3',
                            title: 'Success & Order Progression',
                            filePath: 'assets/images/cdcare_success.png',
                            description:
                                'Smooth transition to order confirmation and verified delivery address display.',
                            icon: Icons.check_circle_outline_rounded,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 48),

                  // 8. GitHub Repository Section
                  _sectionHeader(context, '8. GitHub Repository'),
                  _bodyText(
                    context,
                    'The complete source code, Riverpod state notifiers, mock network simulator, and 29 automated tests are available in the public repository:',
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
                            const FaIcon(
                              FontAwesomeIcons.github,
                              size: 32,
                              color: AppColors.primaryText,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Muhammad-Bashir24 / cdcare',
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _githubRepoUrl,
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
                          'Clone and inspect the standalone Flutter codebase, run the 29 automated tests with `flutter test`, and experiment with the simulated failure bench.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.secondaryText,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: () => _launchUrl(_githubRepoUrl),
                          icon: const FaIcon(
                            FontAwesomeIcons.arrowUpRightFromSquare,
                            size: 16,
                          ),
                          label: const Text('Explore Repository on GitHub'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentGreen,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // 9. Lessons Learned
                  _sectionHeader(context, '9. Lessons Learned'),
                  _bulletItem(
                    context,
                    'Defensive UX in High-Intent Funnels: In checkout and payment flows, ambiguity is fatal to user trust. Explicit states and enforced timeouts protect users from anxiety.',
                  ),
                  _bulletItem(
                    context,
                    'Form Data Is Sacred: An error should never clear valid user input. Decoupling form controller states from network response models prevents accidental data wiping.',
                  ),
                  _bulletItem(
                    context,
                    'Deterministic Edge-Case Simulation: Building an in-app failure simulator dramatically accelerated manual QA and allowed creating predictable automated tests for transient failures.',
                  ),
                  _bulletItem(
                    context,
                    'Riverpod Testability: Riverpod\'s provider override mechanism enabled testing every failure scenario without mocking complex Flutter widget trees or external backend dependencies.',
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

  // --- Helper Widgets ---

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
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentGreen,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
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

  Widget _testCategory(
    BuildContext context, {
    required String title,
    required String detail,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightGreen.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.task_alt_rounded,
            color: AppColors.accentGreen,
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _screenshotPlaceholder(
    BuildContext context, {
    required String stepBadge,
    required String title,
    required String filePath,
    required String description,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borderLight,
          width: 1.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              color: AppColors.lightGreen.withValues(alpha: 0.5),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 40, color: AppColors.accentGreen),
                      const SizedBox(height: 8),
                      Text(
                        stepBadge,
                        style: const TextStyle(
                          color: AppColors.accentGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          filePath,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 11,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: _placeholderTag('Asset Placeholder'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
