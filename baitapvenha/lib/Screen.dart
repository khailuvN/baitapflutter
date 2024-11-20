import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {
      "title": "Mobile App Research",
      "date": "4 Oct",
      "completed": true,
    },
    {
      "title": "Prepare Wireframe for Main Flow",
      "date": "4 Oct",
      "completed": true,
    },
    {
      "title": "Prepare Screens",
      "date": "4 Oct",
      "completed": false,
    },
  ];

  final List<Color> colors = [
    const Color(0xFFFFDCC8), // Peach
    const Color(0xFFC8E6FF), // Light Blue
    const Color(0xFFDCC8E6), // Light Purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Daily Task
              Container(
                height: 139,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF181818),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Daily Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '2/3 Task Completed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'You are almost done go ahead',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '66%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const LinearProgressIndicator(
                          value: 0.66,
                          backgroundColor: Color(0xFF432464),
                          color: Color(0xFFB366FF),
                          minHeight: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title "Today's Task" and "See All"
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today’s Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFFB366FF),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Task List
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    final color = colors[index % colors.length];

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 90,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          // Left color bar
                          Container(
                            width: 10,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(10),
                              ),
                            ),
                          ),

                          // Task details
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              decoration: const BoxDecoration(
                                color: Color(0xFF181818),
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        task['title'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_today_outlined,
                                            color: Colors.white54,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            task['date'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    task['completed']
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                    color: task['completed']
                                        ? const Color(0xFFB366FF)
                                        : Colors.grey,
                                    size: 26,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
