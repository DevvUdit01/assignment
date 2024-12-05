class Project {
  final String name;
  final String deadline;
  final double progress; // Progress as a percentage (e.g., 0.5 = 50%)
  final List<String> subtasks;

  Project({
    required this.name,
    required this.deadline,
    required this.progress,
    required this.subtasks,
  });
}

final List<Project> projects = [
  Project(
    name: "Meta Work Project",
    deadline: "18 Oct 2022",
    progress: 0.56,
    subtasks: ["Research", "Design", "Development"],
  ),
  Project(
    name: "3D Design",
    deadline: "20 Oct 2022",
    progress: 0.78,
    subtasks: ["Modeling", "Texturing", "Rendering"],
  ),
];
