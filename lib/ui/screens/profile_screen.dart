import 'package:flutter/material.dart';
import 'package:plant_app/ui/constants.dart';
import 'package:plant_app/ui/widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Stack the verified icon and image container
            Stack(
              children: [
                // Container for the image with border
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.primaryColor.withOpacity(.5),
                      width: 5.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: ExactAssetImage('assets/images/plant_1.png'),
                  ),
                ),
                // Positioned verified icon on top right
                Positioned(
                  top: 5.0, 
                  right: 5.0, 
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.verified, 
                      color: Colors.blue,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * .3,
              child: Row(
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                ],
              ),
            ),
            Text(
              'johndoe@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(.3),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileWidget(
                  icon: Icons.person,
                  title: 'My Profile',
                ),
                ProfileWidget(
                  icon: Icons.settings,
                  title: 'Settings',
                ),
                ProfileWidget(
                  icon: Icons.notifications,
                  title: 'Notifications',
                ),
                ProfileWidget(
                  icon: Icons.chat,
                  title: 'FAQs',
                ),
                ProfileWidget(
                  icon: Icons.share,
                  title: 'Share',
                ),
                ProfileWidget(
                  icon: Icons.logout,
                  title: 'Log Out',
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
