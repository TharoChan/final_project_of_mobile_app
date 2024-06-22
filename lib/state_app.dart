import 'package:final_project_of_mobile_app/layout_page.dart';
import 'package:flutter/material.dart';
import 'state_app/fontszie_logic.dart';
import 'state_app/theme_logic.dart';
import 'package:provider/provider.dart';

Widget providerStateApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FontSizeLogic()),
      ChangeNotifierProvider(create: (context) => ThemeLogic())
    ],
    child: const StateApp(),
  );
}

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LayoutPage(),
      themeMode: themeIndex == 0
          ? ThemeMode.system
          : themeIndex == 1
              ? ThemeMode.light
              : ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
            iconTheme: IconThemeData(color: Colors.white)),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.blue,
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 16),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey[700],
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.black,
        ),
        expansionTileTheme: ExpansionTileThemeData(
          textColor: Colors.blue[300],
          iconColor: Colors.blue[300],
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.blue[300],
          textColor: Colors.blue[300],
          titleTextStyle: const TextStyle(fontSize: 16),
        ),
        iconTheme: IconThemeData(
          color: Colors.blue[300],
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
