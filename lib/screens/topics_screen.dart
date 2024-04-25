import 'package:flutter/material.dart';
import '../widgets/custom_scaffold.dart';
import 'signin_screen.dart'; // Import SignInScreen
import 'signup_screen.dart';
import 'activity_screen.dart'; // Import ActivityScreen
import '../theme/theme.dart';

class TopicsScreen extends StatelessWidget {
  final String subject;

  TopicsScreen({required this.subject});

  // List of topics for different subjects
  Map<String, List<String>> topics = {
    'Physics': ['Topic 1', 'Topic 2', 'Topic 3'],
    'Chemistry': ['Topic A', 'Topic B', 'Topic C'],
    'Biology': ['Teeth', 'Brain', 'Heart'],
    'Mathematics': ['Algebra', 'Geometry', 'Calculus'],
    'Computer Science': ['Programming', 'Algorithms', 'Data Structures'],
    'Science': ['General Topic 1', 'General Topic 2', 'General Topic 3'],
  };

  @override
  Widget build(BuildContext context) {
    List<String> subjectTopics = topics[subject] ?? [];

    return Scaffold(
      body: CustomScaffold(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Topics - $subject',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: subjectTopics.length,
                        itemBuilder: (context, index) {
                          String topic = subjectTopics[index];
                          return Card(
                            child: ListTile(
                              title: Text(topic),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ActivityScreen(
                                      topic: topic,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
