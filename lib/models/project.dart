class Project {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> technologies;
  final String? linkUrl;

  const Project({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.technologies,
    this.linkUrl,
  });
}
