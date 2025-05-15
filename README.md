<<<<<<< HEAD
# tree

A new Flutter project created with FlutLab - https://flutlab.io

## Getting Started

A few resources to get you started if this is your first Flutter project:

- https://flutter.dev/docs/get-started/codelab
- https://flutter.dev/docs/cookbook

For help getting started with Flutter, view our
https://flutter.dev/docs, which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Getting Started: FlutLab - Flutter Online IDE

- How to use FlutLab? Please, view our https://flutlab.io/docs
- Join the discussion and conversation on https://flutlab.io/residents
=======
Name: Ereeny Nassef Naeem 
Id: 230847702
##Tree Diary App
A simple cross-platform Flutter app that allows users to upload images, write titles and descriptions, and view them in a styled, scrollable layout. The app supports web and mobile platforms and includes a user profile feature.

#Features
-Upload multiple images from device (mobile or web)

- Add a title and descriptive body

- Preview selected images

- Cross-platform support (Web, Android, iOS)

- Profile page with image selection and update

- Favorite widget

- Share icon (non-functional placeholder)

- Themed as a "Tree Diary" to display nature-related content

#Project Structure
plaintext
Copy
Edit
lib/
├── home/
│   └── home_screen/
│       └── home_page.dart     # Displays selected images, title, body, and image grid
├── profile/
│   └── profile_page/
│       └── profile_page.dart  # Displays and updates user profile image
├── firstscreen.dart           # Landing screen for uploading images and text

Install dependencies
Run:

bash
Copy
Edit
flutter pub get
Run the app
For mobile:

bash
Copy
Edit
flutter run
For web:

bash
Copy
Edit
flutter run -d chrome
#Uploading Images
On Web: Uses dart:html to pick multiple images.

On Mobile: Uses image_picker to select from gallery.

Images are previewed in a horizontal scroll view before submission.

# Profile Page
Lets the user select a profile picture via:

- Camera

- Gallery

Displays the profile image in a circular avatar

Uses kIsWeb check to adjust behavior for web vs mobile

# Notes
The app uses kIsWeb to conditionally handle image formats.

Supports both Uint8List (mobile) and Base64 String (web) images.

Navigation between pages uses MaterialPageRoute.

All stateful logic is encapsulated in individual widgets for modularity.

# Dependencies
Make sure the following packages are in your pubspec.yaml:

yaml
Copy
Edit
dependencies:
  flutter:
    sdk: flutter
  image_picker: ^0.8.4+4
For Web support (in addition to Flutter’s beta/stable web support):

yaml
Copy
Edit
dependencies:
  flutter_web_plugins:
    sdk: flutter


https://github.com/user-attachments/assets/b796f1c1-fb62-4650-8d14-ae3b49187716

>>>>>>> e0a315ea681bc20cf3e727f4371df348b6a88476
