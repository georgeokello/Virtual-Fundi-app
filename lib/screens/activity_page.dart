import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../widgets/custom_scaffold.dart';
import 'activity_page.dart'; // Import the Activity page

// Example class for data fetched from the database
class Activity {
  final String timeAllocation;
  final String teachersActivity;
  final String learnersActivity;
  final String note;
  final String video;

  Activity({required this.timeAllocation, required this.teachersActivity, required this.learnersActivity, required this.note, required this.video});
}

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example list of activities fetched from the database
    List<Activity> activities = [
      Activity(timeAllocation: '5 mins', teachersActivity: 'Ice breaker', learnersActivity: 'Participate in an icebreaker activity', note: 'Data 1', video: 'Video URL 1'),
    ];

    return Scaffold(
      body: CustomScaffold(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(height: 10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Text(
                        'Activity Page',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      // Table
                      Column(
                        children: activities.map((activity) {
                          return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Time Allocation:',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 10),
                                      Text(activity.timeAllocation),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "Teacher's Activity:",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 10),
                                      Text(activity.teachersActivity),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "Learner's Activity:",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 10),
                                      Text(activity.learnersActivity),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        'Note:',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 10),
                                      Text(activity.note),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        'Video:',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 10),
                                      IconButton(
                                        icon: Icon(Icons.play_arrow),
                                        onPressed: () {
                                          // Implement video playback functionality
                                          // For example, launch a video player with the provided video URL
                                          // You can use packages like video_player or chewie for video playback
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ActivityPage()),
                          );
                        },
                        child: Text('Next Activity'),
                      ),
                      const SizedBox(height: 20.0),
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
