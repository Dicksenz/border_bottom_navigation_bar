# border_bottom_navigation_bar

A fully customisable Flutter Border Bottom Navigation Bar.

<div style="display:flex">
<img width="355" alt="alert2" src="https://user-images.githubusercontent.com/44444254/158521966-c5567fb6-05f9-4e33-945f-49b9693a2d8b.png" width="200">
<div/>

<b>Usage : </b>

// ignore: use_key_in_widget_constructors
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
    );
  }
}
            
