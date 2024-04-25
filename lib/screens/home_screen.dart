import 'package:flutter/material.dart';
import '../widgets/custom_scaffold.dart';
import 'SessionsPage.dart';
import 'signin_screen.dart'; // Import SignInScreen
import 'signup_screen.dart';
import '../theme/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Map<String, String>> scienceTopics = [
    {'topic': 'Teeth', 'class': 'Class 1', 'term': 'Term 1'},
    {'topic': 'Digestion', 'class': 'Class 2', 'term': 'Term 1'},
  ];

  List<Map<String, String>> filteredTopics = [];

  @override
  void initState() {
    super.initState();
    filteredTopics = List.from(scienceTopics);
  }

  void filterTopics(String query) {
    setState(() {
      filteredTopics = scienceTopics
          .where((topic) =>
          topic['topic']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: DropdownButtonFormField<String>(
                                value: 'Class 1',
                                onChanged: (String? newValue) {},
                                items: <String>[
                                  'Class 1',
                                  'Class 2',
                                  'Class 3',
                                  'Class 4'
                                ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: DropdownButtonFormField<String>(
                                value: 'Term 1',
                                onChanged: (String? newValue) {},
                                items: <String>[
                                  'Term 1',
                                  'Term 2',
                                  'Term 3',
                                  'Term 4'
                                ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5),
                              child: TextField(
                                onChanged: filterTopics,
                                decoration: InputDecoration(
                                  labelText: 'Search',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Topic')),
                            DataColumn(label: Text('Class')),
                            DataColumn(label: Text('Term')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: filteredTopics
                              .map(
                                (topic) => DataRow(
                              cells: [
                                DataCell(Text(topic['topic']!)),
                                DataCell(Text(topic['class']!)),
                                DataCell(Text(topic['term']!)),
                                DataCell(Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle Prepare button press
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SessionsPage(
                                                    topic: topic['topic']!,
                                                    action: 'Prepare'),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Text('Prepare'),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle Start a Lesson button press
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SessionsPage(
                                                    topic: topic['topic']!,
                                                    action:
                                                    'Start a Lesson'),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.green,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Text('Start a Lesson'),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(Icons.facebook),
                          // Icon(Icons.twitter),
                          // Icon(Icons.google),
                          // Icon(Icons.apple),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // Don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
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
