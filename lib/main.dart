import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:tree/dashboard/dashboard_screen.dart';
import 'package:tree/favorite/favorite_model.dart';
import 'add_item/item_model.dart';
import 'dashboard/nav_bar.dart';
import 'profile/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserModel(), // ChangeNotifierProvider
        ),
        ChangeNotifierProvider(
          create: (context) => ItemModel(), // ChangeNotifierProvider
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteModel(), // ChangeNotifierProvider
        ),
      ],
      child: const MyApp(),
    ), // MultiProvider
  );
=======
import 'first_screen.dart';
import 'home/home_screen/home_page.dart';

void main() {
  runApp(const MyApp());
>>>>>>> e0a315ea681bc20cf3e727f4371df348b6a88476
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
<<<<<<< HEAD
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: NavBar(),
=======
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Firstscreen(),
>>>>>>> e0a315ea681bc20cf3e727f4371df348b6a88476
    );
  }
}
