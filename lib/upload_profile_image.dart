import 'package:flutter/material.dart';

class UploadProfileImage extends StatefulWidget {
  const UploadProfileImage({Key? key}) : super(key: key);

  @override
  _UploadProfileImageState createState() => _UploadProfileImageState();
}

class _UploadProfileImageState extends State<UploadProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('UPLOAD PROFILE IMAGE'),
      ),
      body: const Center(
        child: Text('Example of upload'),
      ),
    );
  }
}
