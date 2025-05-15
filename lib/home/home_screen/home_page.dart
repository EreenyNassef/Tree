import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../profile/profile_page/profile_page.dart';
import '../home_widget/home_widget.dart';

class MyHomePage extends StatelessWidget {
  final String? title;
  final String? body;
  final List<dynamic> images;

  const MyHomePage({
    this.title,
    this.body,
    this.images = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: const Icon(Icons.account_box),
          ),
        ],
        centerTitle: true,
        title: Text("The ${title ?? "Tree"}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main Image Display
            if (images.isNotEmpty)
              kIsWeb
                  ? Image.network(images.first as String)
                  : Image.memory(images.first as Uint8List),

            // Content Section
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FavoriteWidget(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                body ??
                    "Like nature's skyscrapers, trees stretch toward the heavens...",
                textAlign: TextAlign.justify,
              ),
            ),

            // Images Grid or Seasonal Fallback
            if (images.isEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MySeason(url: "assets/j.jpg", text: "Fall"),
                  MySeason(url: "assets/i.jpg", text: "Spring"),
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: images.length,
                  itemBuilder: (context, index) => kIsWeb
                      ? Image.network(images[index] as String)
                      : Image.memory(images[index] as Uint8List),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
