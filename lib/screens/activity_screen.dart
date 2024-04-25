import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../widgets/custom_scaffold.dart';
import 'signin_screen.dart'; // Import SignInScreen
import 'signup_screen.dart';
import '../theme/theme.dart';

class ActivityScreen extends StatelessWidget {
  final String topic;

  ActivityScreen({required this.topic});

  // List of activities for different topics
  Map<String, List<String>> activities = {
    'Topic 1': ['Activity 1', 'Activity 2', 'Activity 3'],
    'Topic 2': ['Activity A', 'Activity B', 'Activity C'],
    'Topic 3': ['Activity X', 'Activity Y', 'Activity Z'],
    'Biology': ['Activity Bio 1', 'Activity Bio 2', 'Activity Bio 3'],
    // Add more activities for different topics as needed
  };

  @override
  Widget build(BuildContext context) {
    List<String> topicActivities = activities[topic] ?? [];

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
                        'Activities - $topic',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if (topicActivities.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: topicActivities.length,
                          itemBuilder: (context, index) {
                            String activity = topicActivities[index];
                            return Card(
                              child: ListTile(
                                title: Text(activity),
                                onTap: () {
                                  if (topic == 'Topic 1' &&
                                      activity == 'Activity 3') {
                                    // Navigate to video page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoPage(
                                          videoAssetPath:
                                          'assets/videos/v1.mp4',
                                        ),
                                      ),
                                    );
                                  } else {
                                    // Handle tapping on the activity
                                  }
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

class VideoPage extends StatefulWidget {
  final String videoAssetPath;

  const VideoPage({required this.videoAssetPath});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset(widget.videoAssetPath);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: Center(
        child: Chewie(controller: _chewieController),
      ),
    );
  }
}
