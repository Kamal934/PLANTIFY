
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/ui/constants.dart';
import 'package:plant_app/ui/screens/chatbot_screen.dart';
import 'package:plant_app/ui/screens/profile_screen.dart';
import 'package:plant_app/ui/screens/scan_screen.dart';
import 'package:plant_app/ui/screens/cart_screen.dart';
import 'package:plant_app/ui/screens/favorite_screen.dart';
import 'package:plant_app/ui/screens/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const HomeScreen(),
      FavoriteScreen(favoritedPlants: favorites,),
      CartScreen(addedToCartPlants: myCart,),
      const ProfileScreen(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Hi, User',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            Visibility(
              visible: _bottomNavIndex == 0, // Show only on Home screen
              child: InkWell(
                onTap: () {
                      Navigator.push(context, PageTransition(child:const  ChatbotScreen(), type: PageTransitionType.bottomToTop));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.bubble_chart,
                    color: Color.fromARGB(255, 26, 81, 51),
                    size: 30.0,
                  ),
                ),)),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: ScanScreen(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Constants.primaryColor,
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(100.0), // Adjust radius as needed
  ),
        child: Lottie.asset(
                'assets/animation/animation.json',
                height: 200,
                reverse: true,
                repeat: true,
                fit: BoxFit.cover,
                            
                ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
            final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            favorites = favoritedPlants;
            myCart = addedToCartPlants.toSet().toList();
          });
        }
      ),
    );
  }
}