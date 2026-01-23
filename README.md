# border_bottom_navigation_bar

A fully customisable Flutter Border Bottom Navigation Bar.

<div style="display:flex">
<img width="355" alt="alert2" src="https://private-user-images.githubusercontent.com/44444254/539676374-08f4eb99-690b-4f40-9958-399a500202b1.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjkxNjA3NzQsIm5iZiI6MTc2OTE2MDQ3NCwicGF0aCI6Ii80NDQ0NDI1NC81Mzk2NzYzNzQtMDhmNGViOTktNjkwYi00ZjQwLTk5NTgtMzk5YTUwMDIwMmIxLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjAxMjMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwMTIzVDA5Mjc1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWM3YzQ1NjhiOGRmMzQxMmVjZTM2Mjc1ZjcxOGNjMjQ5MTI5MjQ5NjNjZjQ1MTNiMWEzOTZmZTc1NTE5ODk2MTQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.V_9y1YFMLic9Al5fHokP4yJtf2tLESAjmDrHX2SVbNE" width="200">
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
