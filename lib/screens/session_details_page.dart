import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../widgets/custom_scaffold.dart';
import 'activity_page.dart'; // Import the Activity page

class SessionDetailsPage extends StatelessWidget {
  final String sessionName;

  SessionDetailsPage({required this.sessionName});

  @override
  Widget build(BuildContext context) {
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
                        'Session Name: $sessionName',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      // DataTable
                      DataTable(
                        columns: [
                          DataColumn(label: Text('')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Row(
                              children: [
                                Icon(Icons.access_time),
                                SizedBox(width: 5),
                                Text('Duration: 60 minutes'),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Learning Objectives')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Resources for Theological Knowledge')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Assessment')),
                          ]),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ActivityPage()),
                          );
                        },
                        child: Text('Next'),
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
