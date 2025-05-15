import 'package:flutter/material.dart';

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Top Row with two columns: title and paragraph
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side (Title)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'HELLO THIS ME?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 30), // Space between columns

                // Right side (Paragraph)
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Some of the ads you see do reflect your interests.consequently customize your browsing experience, often by delivering ads targeted to your latest searches and views.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Image
            Image.asset(
              'assets/i.jpg',
              height: 200,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.yellow,
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Step One'),
                  ],
                ),
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.yellow,
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Step Two'),
                  ],
                ),
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.yellow,
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Step Three'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
