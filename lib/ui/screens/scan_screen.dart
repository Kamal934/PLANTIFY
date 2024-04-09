import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_app/ui/constants.dart';
import 'package:plant_app/ui/screens/detector_screen.dart';

// ignore: must_be_immutable
class ScanScreen extends StatelessWidget {
  ScanScreen({super.key});

  File? image;

  Future<void> getImage(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetectorScreen(image:image!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Plant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation/animation.json',
              height: 260,
              reverse: true,
              repeat: true,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Choose Img Source',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            const Divider(),
                            GestureDetector(
                              child: const Text(
                                'Camera',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w100),
                              ),
                              onTap: () {
                                getImage(context, ImageSource.camera);
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                            const Divider(),
                            GestureDetector(
                              child: const Text(
                                'Gallery',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w100),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                getImage(context, ImageSource.gallery);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primaryColor, 
                  foregroundColor: Colors.white, 
                ),
              
              child: const Text(
                'Select Image',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
