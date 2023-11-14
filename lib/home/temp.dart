import 'package:flutter/material.dart';

class RoadmapItem {
  final String title;
  final String description;
  final DateTime date;

  RoadmapItem({required this.title, required this.description, required this.date});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Roadmap'),
        ),
        body: Roadmap(),
      ),
    );
  }
}

class Roadmap extends StatelessWidget {
  final List<RoadmapItem> roadmapItems = [
    RoadmapItem(
      title: 'Step 1',
      description: 'Learn Dart Basics',
      date: DateTime(2023, 1, 1),
    ),
    RoadmapItem(
      title: 'Step 2',
      description: 'Explore Flutter Widgets',
      date: DateTime(2023, 2, 1),
    ),
    RoadmapItem(
      title: 'Step 3',
      description: 'Build Simple Apps',
      date: DateTime(2023, 3, 1),
    ),
    RoadmapItem(
      title: 'Step 4',
      description: 'Learn State Management',
      date: DateTime(2023, 4, 1),
    ),
    // Add more roadmap items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: roadmapItems.length,
      itemBuilder: (BuildContext context, int index) {
        return RoadmapCard(roadmapItem: roadmapItems[index], isLast: index == roadmapItems.length - 1);
      },
    );
  }
}

class RoadmapCard extends StatelessWidget {
  final RoadmapItem roadmapItem;
  final bool isLast;

  RoadmapCard({required this.roadmapItem, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(roadmapItem.title),
            subtitle: Text(roadmapItem.description),
            trailing: Text('${roadmapItem.date.year}-${roadmapItem.date.month}-${roadmapItem.date.day}'),
          ),
          isLast ? Container() : Icon(Icons.arrow_downward),
        ],
      ),
    );
  }
}
