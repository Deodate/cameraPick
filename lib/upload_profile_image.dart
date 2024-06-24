import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadProfileImage extends StatefulWidget {
  const UploadProfileImage({Key? key}) : super(key: key);

  @override
  _UploadProfileImageState createState() => _UploadProfileImageState();
}

class _UploadProfileImageState extends State<UploadProfileImage> {
  File? pickedImage; // Stores the picked image file

  // Function to show image picker options in a bottom sheet using GetX
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Picture Your Document",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera); // Call pickImage with camera source
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery); // Call pickImage with gallery source
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back(); // Close bottom sheet on cancel
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to pick image from camera or gallery based on source
  pickImage(ImageSource imageType) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageType);
      if (pickedFile == null) return;
      final tempImage = File(pickedFile.path);

      setState(() {
        pickedImage = tempImage; // Update pickedImage state with selected image
      });

      Get.back(); // Close bottom sheet after picking an image
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Adjust this according to your design
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: Colors.blue), // Blue border bottom
            ),
          ),
          child: AppBar(
            title: const Text(
              'APPLY & PAY YOUR VISA',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 232, 191, 44),
            centerTitle: true,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 1),
          Container(
            width: double.infinity,
            height: 90,
           color: Color(0xFF317AF7),// Blue background color
            child: const Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 29,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child: pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 170,
                            height: 170,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/idbdVJ3dte.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: IconButton(
                    onPressed: imagePickerOption,
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.38,
                child: ElevatedButton.icon(
                  onPressed: imagePickerOption,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF317AF7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  icon: const Icon(
                    Icons.add_a_photo_sharp,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'APPLY HERE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
