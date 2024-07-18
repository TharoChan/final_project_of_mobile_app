import 'package:flutter/material.dart';
import 'package:final_project_of_mobile_app/constants/constants.dart';
import 'package:final_project_of_mobile_app/screens/home/home_screen.dart';
import 'package:final_project_of_mobile_app/screens/library/library_screen.dart';
import 'package:final_project_of_mobile_app/screens/search/search_category_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: MyColors.blackColor.withOpacity(0.95),
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontFamily: "AM", fontSize: 13),
          selectedItemColor: const Color(0xffE5E5E5),
          unselectedItemColor: MyColors.lightGrey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_home.png'),
              activeIcon: Image.asset('assets/images/icon_home_active.png'),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icon_search_bottomnav.png',
              ),
              activeIcon: Image.asset(
                'assets/images/icon_search_active.png',
                color: MyColors.whiteColor,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icon_library.png',
                color: MyColors.lightGrey,
              ),
              activeIcon: Image.asset(
                'assets/images/icon_library_active.png',
                color: MyColors.whiteColor,
              ),
              label: "Your Library",
            ),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeScreen(),
            SearchCategoryScreen(),
            LibraryScreen(),
            
          ],
        ),
      ),
    );
  }
}
