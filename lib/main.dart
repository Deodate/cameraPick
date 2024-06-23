import 'package:camerapick/upload_profile_image.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMAGE PICKER',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const UploadProfileImage(),
    );
  }
}
