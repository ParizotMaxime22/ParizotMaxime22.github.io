import 'package:flutter/material.dart';
import '../../models/project.dart';
import '../../components/projects/project_item.dart';
import '../../components/projects/project_popup.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final List<Project> participatedProjects = [
    const Project(
      id: 'p1',
      name: 'MeetBiak',
      imageUrl: 'assets/images/project1.jpg',
      description: "Une application sociale dédiée aux fan de K-Pop offrant une mise en relation via un système de swipe ainsi qu'une librairie d'idoles et groupes d'artistes, et une page affichant les dernières news sur le thème de la K-Pop.\nCréer et développé par Clément Romond.",
      technologies: ['Flutter', 'Firebase', 'Dart'],
      linkUrl: 'https://meetbiak.webflow.io/',
    ),
    // const Project(
    //   id: 'p2',
    //   name: 'Project Two',
    //   imageUrl: 'assets/images/project2.jpg',
    //   description: 'This project was a collaborative effort to create a mobile application for a client in the healthcare industry.',
    //   technologies: ['React Native', 'Redux', 'Node.js'],
    //   linkUrl: 'https://example.com/project2',
    // ),
    // const Project(
    //   id: 'p3',
    //   name: 'Project Three',
    //   imageUrl: 'assets/images/project3.jpg',
    //   description: 'A web application developed for an e-commerce business to improve their customer engagement.',
    //   technologies: ['JavaScript', 'Vue.js', 'Express'],
    //   linkUrl: 'https://example.com/project2',
    // ),
    // const Project(
    //   id: 'p4',
    //   name: 'Project Four',
    //   imageUrl: 'assets/images/project4.jpg',
    //   description: 'A data visualization dashboard for a financial institution to track market trends.',
    //   technologies: ['Python', 'D3.js', 'Flask'],
    //   linkUrl: 'https://example.com/project4',
    // ),
  ];

  final List<Project> personalProjects = [
    const Project(
      id: 'personal1',
      name: 'PocketPantryChef',
      imageUrl: 'assets/images/personal1.jpg',
      description: "Ma propre application mobile permettant la gestion des ingrédients disponibles chez soit, la recherche de recettes en fonctions de ceux ci, la gestion de sa liste de courses, et enfin l'aide d'un 'chef virtuel' tournant sous Gemini.",
      technologies: ['Flutter', 'SQLite', 'Firebase', 'Dart'],
    ),
    const Project(
      id: 'personal2',
      name: "Whitecrow's Scuffed bot",
      imageUrl: 'assets/images/personal2.png',
      description: "Un bot Discord permettant aux utilisateurs l'intéraction avec un modèle de language large tournant en local via des requêtes API, intègre une mémoire conversationnelle liée à chaque utilisateur.",
      technologies: ['Python', 'Large Language Models', 'Gestion API'],
    ),
    // const Project(
    //   id: 'personal3',
    //   name: 'Personal Project Three',
    //   imageUrl: 'assets/images/personal3.jpg',
    //   description: 'A web game I built to learn more about canvas rendering and game physics.',
    //   technologies: ['JavaScript', 'HTML Canvas', 'Physics Engine'],
    // ),
  ];

  void _showProjectPopup(BuildContext context, Project project) {
    showDialog(
      context: context,
      builder: (context) => ProjectPopup(
        project: project,
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mes projets',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          const Text(
            'Découvrez mes différents projets professionnels et personnels.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          
          // Participated projects section
          Text(
            'Projets auquel j\'ai participé:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildProjectGrid(context, participatedProjects),
          
          const SizedBox(height: 32),
          
          // Personal projects section
          Text(
            'Projets personnel:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildProjectGrid(context, personalProjects),
        ],
      ),
    );
  }

  Widget _buildProjectGrid(BuildContext context, List<Project> projects) {
    return SizedBox(
      width: double.infinity, // Make the Wrap take up the full width
      child: Wrap(
        alignment: WrapAlignment.start, // or .spaceBetween, .spaceAround, etc.
        spacing: 16,
        runSpacing: 32,
        children: projects.map((project) {
          return ProjectItem(
            project: project,
            onTap: () => _showProjectPopup(context, project),
          );
        }).toList(),
      ),
    );
  }
}