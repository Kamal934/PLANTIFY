import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_app/ui/constants.dart';
import 'package:plant_app/ui/screens/chatbot_screen.dart';

class DetectorScreen extends StatelessWidget {
  final File image;
  const DetectorScreen({super.key, required this.image});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
      ),
      body: Center(
        
        child: Column(
        
          children: [
            // Display the selected image within a CircleAvatar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(image),
              ),
            ),
            const SizedBox(height: 10),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Plant is: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
                const SizedBox(height:10),
                const Text('Confidence is: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
                const SizedBox(height: 90,),
                ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  ChatbotScreen()));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primaryColor, 
                  foregroundColor: Colors.white, 
                ),
                 child: const Text('Precaution',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
                ),),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
