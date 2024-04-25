import 'package:flutter/material.dart';
import 'package:login_signup/screens/signup_screen.dart';
import '../theme/theme.dart';
import '../widgets/custom_scaffold.dart';
import 'session_details_page.dart'; // Import the session details page

class SessionsPage extends StatelessWidget {
  final String topic;

  SessionsPage({required this.topic, required String action});

  @override
  Widget build(BuildContext context) {
    // Dummy list of sessions for demonstration
    List<String> sessions = ['Session 1', 'Session 2', 'Session 3'];

    return Scaffold(
      body: CustomScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
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
                      SizedBox(height: 20.0),
                      Text(
                        topic,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width, // Set the width to the screen width
                          child: DataTable(
                            columnSpacing: 30.0,
                            columns: [
                              DataColumn(label: SizedBox(width: 200, child: Text('Session Name', textAlign: TextAlign.center))),
                              DataColumn(label: SizedBox(width: 120, child: Text('Next', textAlign: TextAlign.center))),
                            ],
                            rows: sessions
                                .map(
                                  (session) => DataRow(
                                cells: [
                                  DataCell(SizedBox(width: 200, child: Text(session, textAlign: TextAlign.center))),
                                  DataCell(Container(
                                    width: 120, // Set a fixed width for the button
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SessionDetailsPage(sessionName: session),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5), // Adjust padding
                                      ),
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14, // Adjust font size
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            )
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Divider(
                        thickness: 0.7,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // IconButtons or Icons for social media login
                        ],
                      ),
                      SizedBox(height: 25.0),
                      // Don't have an account
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          '',
                          style: TextStyle(fontWeight: FontWeight.bold, color: lightColorScheme.primary),
                        ),
                      ),
                      SizedBox(height: 20.0),
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
