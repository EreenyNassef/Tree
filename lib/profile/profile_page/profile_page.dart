import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart'; // Needed for kIsWeb

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker imagePicker = ImagePicker();
  File? selectedImage;

  Future<void> imageSelector(ImageSource source) async {
    final XFile? image = await imagePicker.pickImage(source: source);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void deleteImage() {
    setState(() {
      selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade500,
                  radius: 100,
                  child: selectedImage == null
                      ? const Icon(
                          Icons.person,
                          size: 200,
                          color: Colors.white38,
                        )
                      : ClipOval(
                          child: kIsWeb
                              ? Image.network(selectedImage!.path)
                              : Image.file(
                                  selectedImage!,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                        ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                "Profile",
                                style: TextStyle(fontSize: 20),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Options(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      imageSelector(ImageSource.camera);
                                    },
                                    title: "Camera",
                                    icon: Icons.camera_alt,
                                  ),
                                  Options(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      imageSelector(ImageSource.gallery);
                                    },
                                    title: "Gallery",
                                    icon: Icons.image,
                                  ),
                                  if (selectedImage != null)
                                    Options(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        deleteImage();
                                      },
                                      title: "Delete",
                                      icon: Icons.delete,
                                      selectedImage: selectedImage,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  final String title;
  final IconData icon;
  final File? selectedImage;
  final VoidCallback onPressed;

  const Options({
    required this.onPressed,
    required this.title,
    required this.icon,
    this.selectedImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = (title == "Delete" && selectedImage == null)
        ? Colors.grey
        : (title == "Delete" ? Colors.red : Colors.black);

    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: iconColor),
        ),
        Text(
          title,
          style: TextStyle(color: iconColor),
        ),
      ],
    );
  }
}
