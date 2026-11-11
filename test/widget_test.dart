import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muhammadbashir_dev/core/theme/app_theme.dart';
import 'package:muhammadbashir_dev/data/portfolio_data/portfolio_config.dart';
import 'package:muhammadbashir_dev/presentation/pages/case_study_page.dart';
import 'package:muhammadbashir_dev/presentation/pages/reliable_checkout_case_study_page.dart';
import 'package:muhammadbashir_dev/presentation/sections/projects_section.dart';

void main() {
  test('PortfolioConfig contains Reliable Mobile Checkout case study', () {
    final checkoutProject = PortfolioConfig.projects.firstWhere(
      (p) => p.id == 'cdcare-reliable-checkout',
    );

    expect(checkoutProject.name,
        'Reliable Mobile Checkout — Independent Flutter Case Study');
    expect(checkoutProject.githubUrl,
        'https://github.com/Muhammad-Bashir24/cdcare');
    expect(checkoutProject.technologies, contains('Riverpod'));
    expect(checkoutProject.technologies, contains('Flutter'));
    expect(checkoutProject.technologies, contains('Automated Testing'));
  });

  testWidgets('ProjectsSection displays Reliable Checkout card and navigates',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const Scaffold(
          body: SingleChildScrollView(child: ProjectsSection()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Verify card is rendered
    expect(find.text('Featured Projects'), findsOneWidget);
    expect(
      find.text('Reliable Mobile Checkout — Independent Flutter Case Study'),
      findsOneWidget,
    );
    expect(find.text('Case Study Prototype'), findsOneWidget);

    // Tap the first "View Case Study" button (which belongs to our checkout study)
    final viewCaseStudyButtons =
        find.widgetWithText(OutlinedButton, 'View Case Study');
    expect(viewCaseStudyButtons, findsWidgets);

    await tester.tap(viewCaseStudyButtons.first);
    await tester.pumpAndSettle();

    // Verify navigation to ReliableCheckoutCaseStudyPage
    expect(find.byType(ReliableCheckoutCaseStudyPage), findsOneWidget);
    expect(find.text('Independent Exploration Disclaimer'), findsOneWidget);
  });

  testWidgets(
      'ProjectsSection navigates to CaseStudyPage for featured project (SendBash)',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const Scaffold(
          body: SingleChildScrollView(child: ProjectsSection()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Tap the second "View Case Study" button (which belongs to SendBash)
    final viewCaseStudyButtons =
        find.widgetWithText(OutlinedButton, 'View Case Study');
    expect(viewCaseStudyButtons, findsWidgets);

    await tester.tap(viewCaseStudyButtons.at(1));
    await tester.pumpAndSettle();

    // Verify navigation to CaseStudyPage with unified rich design
    expect(find.byType(CaseStudyPage), findsOneWidget);
    expect(find.text('FEATURED CASE STUDY'), findsOneWidget);
    expect(find.text('SendBash'), findsWidgets);
    expect(find.text('1. Overview'), findsOneWidget);
  });

  testWidgets('CaseStudyPage renders redesigned case study UI with all sections',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final sendBashProject = PortfolioConfig.projects.firstWhere(
      (p) => p.id == 'sendbash',
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: CaseStudyPage(project: sendBashProject),
      ),
    );
    await tester.pumpAndSettle();

    // Hero & Badges
    expect(find.text('FEATURED CASE STUDY'), findsOneWidget);
    expect(find.text('FLUTTER'), findsOneWidget);
    expect(find.text('PRODUCTION PROJECT'), findsOneWidget);

    // Metadata
    expect(find.text('Role'), findsOneWidget);
    expect(find.text('Architecture'), findsWidgets);
    expect(find.text('Tech Stack'), findsOneWidget);

    // Numbered Section Headers matching CDcare style
    expect(find.text('1. Overview'), findsOneWidget);
    expect(find.text('2. The Problem'), findsOneWidget);
    expect(find.text('3. The Solution'), findsOneWidget);
    expect(find.text('4. Key Features'), findsOneWidget);
    expect(
      find.text('5. Architecture & Technical Implementation'),
      findsOneWidget,
    );
    expect(
      find.text('6. Engineering Challenges & Solutions'),
      findsOneWidget,
    );
    expect(
      find.text('7. Project Availability & Links'),
      findsOneWidget,
    );

    // Solution Pillars
    expect(find.text('Solution Strategy 1'), findsOneWidget);
    expect(find.text('Solution Strategy 2'), findsOneWidget);

    // Challenge & Solution Cards
    expect(find.text('CHALLENGE 1'), findsOneWidget);
    expect(find.text('CHALLENGE 2'), findsOneWidget);
    expect(find.text('SOLUTION'), findsWidgets);

    // Architecture container
    expect(
      find.text('System Architecture & Engineering Highlights'),
      findsOneWidget,
    );
  });

  testWidgets('ReliableCheckoutCaseStudyPage renders all required sections',
      (WidgetTester tester) async {
    // Provide adequate surface size for desktop rendering
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const ReliableCheckoutCaseStudyPage(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Title & Hero
    expect(find.text('Reliable Mobile Checkout'), findsOneWidget);
    expect(find.text('INDEPENDENT FLUTTER CASE STUDY'), findsOneWidget);

    // Verify Mandatory Disclaimer
    expect(find.text('Independent Exploration Disclaimer'), findsOneWidget);

    // Verify Sections
    expect(find.text('1. Overview'), findsOneWidget);
    expect(find.text('2. Problem Observed'), findsOneWidget);
    expect(find.text('3. Proposed Solution'), findsOneWidget);
    expect(find.text('4. Key Features'), findsOneWidget);
    expect(find.text('5. Technical Implementation'), findsOneWidget);
    expect(find.text('6. Testing (29 Tests Passed)'), findsOneWidget);
    expect(find.text('7. Screenshots & Demo'), findsOneWidget);
    expect(find.text('8. GitHub Repository'), findsOneWidget);
    expect(find.text('9. Lessons Learned'), findsOneWidget);

    // Verify Placeholders are present
    expect(find.text('DEMO VIDEO PLACEHOLDER'), findsOneWidget);
    expect(find.text('STEP 1'), findsOneWidget);
    expect(find.text('STEP 2'), findsOneWidget);
    expect(find.text('STEP 3'), findsOneWidget);

    // Verify GitHub Action
    expect(find.text('Explore Repository on GitHub'), findsOneWidget);
  });
}
