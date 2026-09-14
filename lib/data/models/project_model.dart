class Project {
  final String id;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final String problem;
  final String solution;
  final String role;
  final List<String> features;
  final String architecture;
  final List<String> technologies;
  final List<String> challenges;
  final List<String> solutions;
  final String? githubUrl;
  final String? liveUrl;
  final String? imagePath;

  const Project({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.problem,
    required this.solution,
    required this.role,
    required this.features,
    required this.architecture,
    required this.technologies,
    required this.challenges,
    required this.solutions,
    this.githubUrl,
    this.liveUrl,
    this.imagePath,
  });
}
