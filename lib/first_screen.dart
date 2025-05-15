import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'home/home_screen/home_page.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  final ImagePicker _imagePicker = ImagePicker();
  List<dynamic> _selectedImages = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  Future<void> _selectImages() async {
    if (kIsWeb) {
      final uploadInput = html.FileUploadInputElement();
      uploadInput.multiple = true;
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        if (files != null && files.isNotEmpty) {
          final newImages = <String>[];
          for (final file in files) {
            final reader = html.FileReader();
            reader.readAsDataUrl(file);
            await reader.onLoadEnd.first;
            newImages.add(reader.result as String);
          }
          setState(() => _selectedImages.addAll(newImages));
        }
      });
    } else {
      final images = await _imagePicker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        final imageBytes = await Future.wait(
            images.map((xfile) => File(xfile.path).readAsBytes()));
        setState(() => _selectedImages.addAll(imageBytes));
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            const SizedBox(height: 150),

            // Upload Area (Always visible)
            GestureDetector(
              onTap: _selectImages,
              child: Container(
                color: Colors.white,
                height: 100,
                width: MediaQuery.of(context).size.width - 24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.camera_alt, size: 40),
                    const SizedBox(height: 8),
                    Text(
                      _selectedImages.isEmpty
                          ? "Tap to add images"
                          : "Tap to add more images",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Selected Images Preview
            if (_selectedImages.isNotEmpty)
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedImages.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      children: [
                        kIsWeb
                            ? Image.network(
                                _selectedImages[index] as String,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                            : Image.memory(
                                _selectedImages[index] as Uint8List,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.close, size: 16),
                            onPressed: () => _removeImage(index),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // Title Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Body Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _bodyController,
                minLines: 3,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Body",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter title and body')),
            );
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                title: _titleController.text,
                body: _bodyController.text,
                images: _selectedImages,
              ),
            ),
          );
        },
      ),
    );
  }
}
