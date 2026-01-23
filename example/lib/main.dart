import 'package:border_bottom_navigation_bar/border_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey[350],
              image: DecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/id/$index/500',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BorderBottomNavigationBar(
        height: 80,
        currentIndex: _currentIndex,
        borderRadiusValue: 25,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedLabelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        backgroundColor: Colors.black,
        unselectedBackgroundColor: Colors.transparent,
        selectedBackgroundColor: const Color(0xFF0F3042),
        unselectedIconColor: Colors.grey,
        selectedIconColor: Colors.lightBlueAccent,
        customBottomNavItems: [
          BorderBottomNavigationItems(
            icon: Icons.camera_alt_outlined,
            label: 'Camera',
          ),
          BorderBottomNavigationItems(
            icon: Icons.location_on_outlined,
            label: 'Map',
          ),
          BorderBottomNavigationItems(
            icon: Icons.calendar_today_outlined,
            label: 'Event',
          ),
          BorderBottomNavigationItems(
            icon: Icons.more_horiz,
            label: 'More',
          ),
        ],
      ),
    );
  }
}
