# border_bottom_navigation_bar

A fully customisable Flutter Border Bottom Navigation Bar.

<div style="display:flex">
<img width="355" alt="alert2" src="https://user-images.githubusercontent.com/44444254/145979456-6bb152cc-1906-420f-b2a8-b0ec1615b1a6.png" width="200">
<div/>

<b>Usage</b>
    bottomNavigationBar: BorderBottomNavigationBar(
        height: 53,
        currentIndex: _currentIndex,
        borderRadiusValue: 25,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          print(index);
        },
        selectedLabelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        selectedBackgroundColor: Colors.blue[900]!,
        unselectedBackgroundColor: Colors.grey[200]!,
        unselectedIconColor: Colors.grey[600]!,
        selectedIconColor: Colors.white,
        customBottomNavItems: [
          BorderBottomNavigationItems(
            icon: Icons.home,
          ),
          BorderBottomNavigationItems(
            icon: Icons.event_note_outlined,
          ),
          BorderBottomNavigationItems(
            icon: Icons.add_circle_outline_outlined,
          ),
          BorderBottomNavigationItems(
            icon: Icons.rss_feed_outlined,
          ),
          BorderBottomNavigationItems(
            icon: Icons.more_horiz,
          ),
        ],
      ),

            
