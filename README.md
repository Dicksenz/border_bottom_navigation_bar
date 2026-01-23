# border_bottom_navigation_bar

A fully customisable Flutter Border Bottom Navigation Bar.

<div style="display:flex">
<img width="355" alt="alert2" src="https://github.com/Dicksenz/border_bottom_navigation_bar/blob/main/screenshot.png?raw=true" width="200">
<div/>

<b>Usage : </b>

                    class HomeView extends StatefulWidget {
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
                            // Custom colors for Material 3 dark theme
                            backgroundColor: Colors.black,
                            selectedBackgroundColor: const Color(0xFF0F3042), // Dark teal for pill

                            selectedLabelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            unselectedBackgroundColor: Colors.transparent,
                            unselectedIconColor: Colors.grey,
                            selectedIconColor: Colors.lightBlueAccent,
                            selectedIconSize: 24,
                            unselectedIconSize: 24,
                            customBottomNavItems: [
                            BorderBottomNavigationItems(
                                icon: Icons.camera_alt_outlined,
                                label: 'Camera',
                            ),
                            BorderBottomNavigationItems(
                                icon: Icons.location_on_outlined,
                                label: 'Map', // Labels are now required
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
