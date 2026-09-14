import '../models/skill_model.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';

class PortfolioConfig {
  static const String name = 'Muhammad Bashir';
  static const String title = 'Mobile Engineer';
  static const String headline =
      'Building reliable, scalable and delightful mobile experiences. \n Shipped 3+ apps to PlayStore and AppStore.';

  static const String aboutMe =
      "I specialize in building production-ready mobile applications, integrating backend services, and solving real-world product problems. My focus is on Clean Architecture, scalable systems, and delivering a great user experience.";

  static const List<String> heroTechnologies = [
    'Flutter',
    'Dart',
    'Kotlin',
    'React Native',
    'Firebase',
    'Supabase',
    'REST APIs',
  ];

  static const List<SkillCategory> skills = [
    SkillCategory(
      title: 'Mobile Development',
      skills: ['Flutter', 'Dart', 'Kotlin', 'Android', 'React Native'],
    ),
    SkillCategory(
      title: 'Architecture & State Management',
      skills: [
        'Clean Architecture',
        'BLoC',
        'Cubit',
        'Riverpod',
        'Provider',
        'Dependency Injection',
      ],
    ),
    SkillCategory(
      title: 'Backend & APIs',
      skills: [
        'REST APIs',
        'Firebase',
        'Supabase',
        'Cloud Functions',
        'Authentication',
        'Database integration',
      ],
    ),
    SkillCategory(
      title: 'Engineering',
      skills: [
        'Git',
        'GitHub',
        'CI/CD',
        'Testing',
        'Debugging',
        'Performance Optimization',
        'App Store Deployment',
        'Google Play Deployment',
      ],
    ),
    SkillCategory(
      title: 'Integrations',
      skills: [
        'Payment systems',
        'Push Notifications',
        'Analytics',
        'Third-party APIs',
      ],
    ),
  ];

  static const Map<String, String> socialLinks = {
    'GitHub': 'https://github.com/Muhammad-Bashir24',
    'LinkedIn':
        'https://www.linkedin.com/in/muhammad-bashir-olatundun-7ba6703a2/',
    'X': 'https://x.com/Bashir1k',
    'Email': 'muhammadbashirolatundun@gmail.com',
  };

  static const List<String> services = [
    'Flutter App Development',
    'Mobile Application Development',
    'API Integration',
    'Payment Integration',
    'Authentication Systems',
    'App Architecture',
    'Performance Optimization',
    'Existing App Refactoring',
    'App Store / Play Store Deployment',
    'Mobile UI Implementation',
  ];

  static const List<Experience> experiences = [
    Experience(
      role: 'Mobile Engineer',
      company: 'XBuildApp Tech Solutions',
      period: '2024 — Present',
      description:
          'Architected and built a scalable mobile application from scratch. Led the transition to Clean Architecture, significantly improving code maintainability and testability. Mentored junior developers and established CI/CD pipelines for automated Play Store and App Store deployments.',
      technologies: [
        'Flutter',
        'Dart',
        'Clean Architecture',
        'Provider',
        'Bloc',
        'Firebase',
        'Supabase',
        'REST APIs',
        'Codemagic',
      ],
    ),
    Experience(
      role: 'Flutter Developer',
      company: 'Altris Product System',
      period: '2025 — Present',
      description:
          'Developed and maintained multiple cross-platform applications for international clients. Implemented complex UI designs, integrated payment gateways , and optimized application performance, resulting in a 40% reduction in app load time.',
      technologies: [
        'Flutter',
        'GetX',
        'Bloc',
        'Provider',
        'Rest APIs',
        'Payment Integrations',
        'Google Maps API',
      ],
    ),
  ];

  static const List<Project> projects = [
    Project(
      id: 'sendbash',
      name: 'SendBash',
      shortDescription:
          'A Flutter mobile application built to simplify digital payments and everyday service requests.',
      fullDescription:
          'SendBash is a mobile platform focused on making everyday financial and service-related activities more convenient through a secure and user-friendly Flutter application. The project involved building reusable mobile interfaces and integrating backend services to support core application workflows.',
      problem:
          'Users need simple and reliable mobile experiences for carrying out financial and everyday service-related activities from one application.',
      solution:
          'Built a modular Flutter application with structured application flows, backend integration, secure data handling, and reusable UI components.',
      role: 'Mobile Engineer',
      features: [
        'Payment Workflows',
        'User Authentication',
        'Service Requests',
        'Secure Data Handling',
        'Responsive Mobile UI',
      ],
      architecture:
          'Flutter application structured with a modular architecture and separated presentation, business logic, and data concerns.',
      technologies: [
        'Flutter',
        'Dart',
        'Supabase',
        'PostgreSQL',
        'Edge Functions',
        'Paystack',
      ],
      challenges: [
        'Integrating financial workflows while maintaining reliable application state and error handling.',
        'Keeping the application structure maintainable as multiple features were introduced.',
      ],
      solutions: [
        'Separated application responsibilities into reusable layers and components.',
        'Implemented structured error handling and backend integrations for critical workflows.',
      ],
      githubUrl: null,
      liveUrl: null,
      imagePath: 'assets/images/sendbash.png',
    ),

    Project(
      id: 'insuriq',
      name: 'InsurIQ',
      shortDescription:
          'A mobile insurance platform designed to simplify insurance-related services and user interactions.',
      fullDescription:
          'InsurIQ is a Flutter-based insurance application focused on providing users with a streamlined mobile experience for accessing insurance services. The project involved implementing mobile interfaces, application flows, backend integration, and reliable state management for a fintech-oriented product environment.',
      problem:
          'Traditional insurance experiences can be difficult to navigate, making it important to provide users with a simpler and more accessible mobile experience.',
      solution:
          'Developed structured Flutter screens and application flows with reusable components, backend integration, and predictable state management.',
      role: 'Mobile Engineer',
      features: [
        'Insurance Workflows',
        'User Authentication',
        'Policy-related Interfaces',
        'Payment Integration',
        'Form Handling',
      ],
      architecture:
          'Feature-based Flutter architecture using Riverpod for state management.',
      technologies: ['Flutter', 'Dart', 'Bloc', 'Firebase', 'Cloud Functions'],
      challenges: [
        'Managing complex application state across multiple insurance and authentication workflows.',
        'Maintaining consistent UI states for loading, success, and failure scenarios.',
      ],
      solutions: [
        'Used Bloc to provide predictable and scalable state management.',
        'Implemented reusable states and structured error handling across application flows.',
      ],
      githubUrl: null,
      liveUrl: 'https://insuriq.io/',
      imagePath: 'assets/images/insureiq.png',
    ),

    Project(
      id: 'fundedu',
      name: 'FundedU',
      shortDescription:
          'A scholarship and grant discovery platform helping students discover educational funding opportunities.',
      fullDescription:
          'FundedU is a mobile platform that helps students discover scholarships, grants, and other educational funding opportunities. The platform provides a centralized place for students to explore opportunities and manage relevant information, supported by a backend and administrative system for managing available opportunities.',
      problem:
          'Students often struggle to discover legitimate scholarship and grant opportunities because information is scattered across different websites and platforms.',
      solution:
          'Built a centralized Flutter application where students can browse and discover funding opportunities, while backend services support opportunity management and application data.',
      role: 'Mobile Engineer',
      features: [
        'Scholarship Discovery',
        'Grant Discovery',
        'Opportunity Details',
        'Search and Filtering',
        'User Profiles',
        'Application Information',
        'Admin Management',
      ],
      architecture:
          'Flutter application using GetX for state management with Supabase backend services.',
      technologies: [
        'Flutter',
        'Dart',
        'GetX',
        'Supabase',
        'PostgreSQL',
        'Edge Functions',
      ],
      challenges: [
        'Handling a growing collection of scholarship and grant opportunities efficiently.',
        'Providing users with useful search and filtering capabilities.',
      ],
      solutions: [
        'Implemented search, filtering, debouncing, and pagination to improve performance and user experience.',
        'Used Supabase and PostgreSQL to provide structured and scalable backend data management.',
      ],
      githubUrl: null,
      liveUrl: 'https://fundedu.com.ng/',
      imagePath: 'assets/images/fundedu.png',
    ),

    Project(
      id: 'claritask-ai',
      name: 'ClariTask AI',
      shortDescription:
          'An AI-powered productivity application that helps users turn goals and projects into actionable tasks.',
      fullDescription:
          'ClariTask AI is an AI-powered productivity application designed to help users organize their work, break down goals into actionable tasks, and stay consistent with their plans. The application includes authentication, personalization, and a personalized home experience that adapts to the user profile and preferences.',
      problem:
          'People often struggle to make progress on large goals because they do not know how to turn them into clear, manageable actions.',
      solution:
          'Built a personalized productivity experience that uses AI-assisted workflows to help users structure their goals and tasks while adapting the application experience to their preferences.',
      role: 'Mobile Developer',
      features: [
        'AI-Assisted Task Planning',
        'Goal Management',
        'User Personalization',
        'Personalized Dashboard',
        'Progress Tracking',
        'Authentication',
      ],
      architecture:
          'Flutter Clean Architecture with feature-based organization and Cubit/BLoC for state management.',
      technologies: [
        'Flutter',
        'Dart',
        'Cubit',
        'BLoC',
        'Supabase',
        'PostgreSQL',
        'Edge Functions',
        'Gemini AI',
      ],
      challenges: [
        'Designing a scalable architecture that supports authentication, personalization, and AI-powered features.',
        'Ensuring the home experience dynamically reflects each user’s personalization data.',
      ],
      solutions: [
        'Implemented separation of presentation, domain, and data responsibilities using Clean Architecture principles.',
        'Built authentication and personalization flows that retrieve user preferences and use them to configure the dashboard experience.',
      ],
      githubUrl: null,
      liveUrl: null,
      imagePath: 'assets/images/claritaskai.png',
    ),

    Project(
      id: 'flowpayee',
      name: 'FlowPayee',
      shortDescription:
          'A fintech mobile application with secure authentication and integrated digital payment workflows.',
      fullDescription:
          'FlowPayee is a fintech-focused Flutter application built around secure user onboarding, authentication, and payment experiences. The project involved implementing authentication workflows, OTP verification, payment initialization, payment verification, and integration with backend services.',
      problem:
          'Fintech applications require secure authentication and reliable payment workflows while maintaining a smooth experience for users.',
      solution:
          'Implemented structured authentication and payment flows in Flutter, connecting the mobile application to backend services for OTP handling, account creation, payment initialization, and transaction verification.',
      role: 'Mobile Engineer',
      features: [
        'User Onboarding',
        'OTP Verification',
        'Account Creation',
        'Secure Authentication',
        'Payment Initialization',
        'Payment Verification',
        'Transaction States',
      ],
      architecture:
          'Feature-based Flutter architecture using Provider for state management with repository-based separation of concerns.',
      technologies: [
        'Flutter',
        'Dart',
        'Provider',
        'Supabase',
        'Firebase',
        'Cloud Functions',
        'Paystack',
      ],
      challenges: [
        'Building reliable authentication flows involving OTP verification and backend functions.',
        'Managing payment states from initialization through verification.',
        'Handling different payment currencies and backend payment-provider requirements.',
      ],
      solutions: [
        'Implemented structured authentication states with clear loading, success, and error handling.',
        'Created a dedicated payment flow with state management, backend Cloud Functions, and transaction verification.',
      ],
      githubUrl: null,
      liveUrl: null,
      imagePath: null,
    ),
  ];
}
