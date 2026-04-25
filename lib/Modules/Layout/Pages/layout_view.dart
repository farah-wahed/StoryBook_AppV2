import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../Core/Const/color_pallet.dart';
import '../../../gen/assets.gen.dart';
import 'Favorite/favorite_view.dart';
import 'Home/home_view.dart';
import 'Story/NewStory/new_story_view.dart';


class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}
class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens =[
    HomeView(),
    FavoriteView(),


  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: Bounceable(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NewStoryView()),
          );
        },
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 24,
            backgroundColor:  ColorPallet.primaryColor,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorPallet.primaryColor,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        }, items: [
        BottomNavigationBarItem(
          icon: Assets.icons.homeIcon.image(height: 24),
          activeIcon: Assets.icons.selectedHomeIcon.image(height: 24),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.favoreticon.image(height: 24),
          activeIcon: Assets.icons.selectedFavoriteCon.image(height: 24),
          label: "Favorites",
        ),

      ],

      ),


    );
  }
}
