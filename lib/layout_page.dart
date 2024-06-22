// import 'package:final_project_of_mobile_app/pages/home_page/home_page.dart';
// import 'package:final_project_of_mobile_app/pages/library_page/library_page.dart';
// import 'package:final_project_of_mobile_app/pages/premium_page/premium_page.dart';
// import 'package:final_project_of_mobile_app/pages/search_page/search_page.dart';
// import 'package:flutter/material.dart';

// class LayoutPage extends StatefulWidget {
//   const LayoutPage({super.key});

//   @override
//   State<LayoutPage> createState() => _LayoutPageState();
// }

// class _LayoutPageState extends State<LayoutPage> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: _buildBody(),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   int _pageIndex = 0;
//   Widget _buildBody() {
//     return IndexedStack(
//       index: _pageIndex,
//       children: const [HomePage(), SearchPage(), LibraryPage(), PremiumPage()],
//     );
//   }

//   int _navIndex = 0;

//   Widget _buildBottomNavBar() {
//     return BottomNavigationBar(
//       currentIndex: _navIndex,
//       onTap: (index) {
//         setState(() {
//           _navIndex = index;
//           _pageIndex = index;
//         });
//       },
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.pink,
//       unselectedItemColor: Colors.grey,
//       // showSelectedLabels: false,
//       showUnselectedLabels: false,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label: "Search",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.book),
//           label: "Your Library",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.circle_sharp),
//           label: "Premuim",
//         ),
//       ],
//     );
//   }
// }

import 'package:final_project_of_mobile_app/pages/home_page/home_page.dart';
import 'package:final_project_of_mobile_app/pages/library_page/library_page.dart';
import 'package:final_project_of_mobile_app/pages/premium_page/premium_page.dart';
import 'package:final_project_of_mobile_app/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project_of_mobile_app/state_app/fontszie_logic.dart';
import 'package:final_project_of_mobile_app/state_app/theme_logic.dart';
import 'package:provider/provider.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double size = context.watch<FontSizeLogic>().size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 28, 16, 16),
        elevation: 1,
        title: const Text("First Screen"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                //   _counter--;
                context.read<FontSizeLogic>().decrease();
              });
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                // _counter++;
                context.read<FontSizeLogic>().increase();
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _buildBody(size),
      bottomNavigationBar: _buildBottomNavBar(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Icon(Icons.face)),
          ExpansionTile(
            title: const Text(
              'Theme',
              style: TextStyle(color: Colors.white),
            ),
            initiallyExpanded: true,
            children: [
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: const Text("Change to system mode"),
                onTap: () {
                  context.read<ThemeLogic>().changeToSystemMode();
                },
                trailing: themeIndex == 0 ? const Icon(Icons.check) : null,
              ),
              ListTile(
                leading: const Icon(Icons.light_mode),
                title: const Text("Change to light mode"),
                onTap: () {
                  context.read<ThemeLogic>().changeToLightMode();
                },
                trailing: themeIndex == 1 ? const Icon(Icons.check) : null,
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Change to dark mode"),
                onTap: () {
                  context.read<ThemeLogic>().changeToDarkMode();
                },
                trailing: themeIndex == 2 ? const Icon(Icons.check) : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _pageIndex = 0;
  Widget _buildBody(double size) {
    return IndexedStack(
      index: _pageIndex,
      children: [
        HomePage(size: size),
        SearchPage(size: size),
        LibraryPage(size: size),
        PremiumPage(size: size)
      ],
    );
  }

  int _navIndex = 0;

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      // backgroundColor: Colors.black,
      elevation: 0,
      currentIndex: _navIndex,
      onTap: (index) {
        setState(() {
          _navIndex = index;
          _pageIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      // selectedItemColor: Colors.white,
      // unselectedItemColor: Colors.grey,
      // showSelectedLabels: false,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Your Library",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.circle_sharp),
          label: "Premuim",
        ),
      ],
    );
  }
}
