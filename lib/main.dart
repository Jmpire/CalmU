import 'package:calmu/values/app_constants.dart';
import 'package:calmu/values/app_routes.dart';
import 'package:calmu/views/communities.dart';
import 'package:calmu/views/doctors.dart';
import 'package:calmu/views/me.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'views/home.dart';

Future<void> main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.purple,
    statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white),
  );
    return MaterialApp(
      title: 'CalmU',
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', ''),
      // initial home route
      initialRoute: AppRoutes.home,
      navigatorKey: AppConstants.navigationKey,
      // initialize app routes
      routes: {
        AppRoutes.home: (context) => const Home(),
        AppRoutes.doctors: (context) => const Doctor(),
        AppRoutes.bottom: (context) => const BottomNavBar(),
        AppRoutes.communities: (context) => const Community(),
        AppRoutes.profile:(context) => const Profile()
      },
      
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple, background: Colors.white, primary: Colors.amber),
        useMaterial3: true,
      ),
      
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
    
  }
}

class BottomNavBar extends StatefulWidget {
  static int initialPage = 0;
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  void getTheme() {}

  @override
  Widget build(BuildContext context) {
    getTheme();
    List<Widget> buildScreens() {
      return [
        const Home(),
        const Doctor(),
        const Community(),
        const Profile(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_rounded, size: 30),
          inactiveIcon: const Icon(Icons.home_outlined, size: 30),
          title: ("Home"),
          textStyle: const TextStyle(fontSize: 10),
          activeColorPrimary: Colors.purple,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.medical_services, size: 28),
          inactiveIcon: const Icon(Icons.medical_services_outlined, size: 28),
          title: ("Doctors"),
          textStyle: const TextStyle(fontSize: 10),
          activeColorPrimary: Colors.purple,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.people_alt_rounded, size: 28),
          inactiveIcon: const Icon(Icons.people_alt_outlined, size: 28),
          inactiveColorSecondary: Colors.grey,
          title: ("Communities"),
          textStyle: const TextStyle(fontSize: 10),
          activeColorPrimary: Colors.purple,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
           icon: const Icon(Icons.density_medium_rounded, size: 28),
          inactiveIcon: const Icon(Icons.density_medium_outlined, size: 28),
          title: ("Profile"),
          textStyle: const TextStyle(fontSize: 10),
          activeColorPrimary: Colors.purple,
          inactiveColorPrimary: Colors.black,
        ),
      ];
    }

    PersistentTabController controller;
    controller =
        PersistentTabController(initialIndex: BottomNavBar.initialPage);
    return PersistentTabView(context, onItemSelected: (value) {
      setState(() {});
    },
        //navBarHeight: 50,
        screens: buildScreens(),
        items: navBarsItems(),
        controller: controller,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          //colorBehindNavBar: AppColors.background!,
          boxShadow: [const BoxShadow(color: Colors.grey, blurRadius: 0.1)],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: false, // don't animate screen transitions
          duration: Duration(milliseconds: 0),
        ),
        navBarStyle: NavBarStyle.simple);
  }
}

// This navbar is applied to screens that have a simple navigation bar
class SimpleAppBar extends StatefulWidget {
  final String title;
  const SimpleAppBar({super.key, required this.title});
  @override
  State<SimpleAppBar> createState() => _SimpleAppBarState();
}

class _SimpleAppBarState extends State<SimpleAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      title: Text(widget.title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black)),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          )),
      elevation: 0.2,
    );
  }
}
