import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DrawerViewPractise extends StatefulWidget {
  const DrawerViewPractise({super.key, required this.title});

  final String title;

  @override
  State<DrawerViewPractise> createState() => _DrawerViewPractiseState();
}

class _DrawerViewPractiseState extends State<DrawerViewPractise> {
  int _selectedIndex = 0;
  int _selectedTabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title[_selectedIndex]),
        ),
        body: _body[_selectedIndex],
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: _selectedTabIndex,
            selectedItemColor: const Color(0xff6200ee),
            unselectedItemColor: const Color(0xff757575),
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            items: _navBar[_selectedIndex]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Home'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Business'),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('School'),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// final _navBarItems = [
//   SalomonBottomBarItem(
//     icon: const Icon(Icons.home),
//     title: const Text("Home"),
//     selectedColor: Colors.purple,
//   ),
//   SalomonBottomBarItem(
//     icon: const Icon(Icons.favorite_border),
//     title: const Text("Likes"),
//     selectedColor: Colors.pink,
//   ),
//   SalomonBottomBarItem(
//     icon: const Icon(Icons.search),
//     title: const Text("Search"),
//     selectedColor: Colors.orange,
//   ),
//   SalomonBottomBarItem(
//     icon: const Icon(Icons.person),
//     title: const Text("Profile"),
//     selectedColor: Colors.teal,
//   ),
// ];

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

// const List<Widget> _widgetOptions = <Widget>[
//   Text(
//     'Index 0: Home',
//     style: optionStyle,
//   ),
//   Text(
//     'Index 1: Profile',
//     style: optionStyle,
//   ),
//   Text(
//     'Index 2: School',
//     style: optionStyle,
//   ),
// ];

const List<String> _title = [
  "Home",
  "Profile",
  "Home",
];
const List<Widget> _body = [
  Text(
    'Index 0: Home',
    style: optionStyle,
  ),
  Text(
    'Index 1: Business',
    style: optionStyle,
  ),
  Text(
    'Index 2: School',
    style: optionStyle,
  ),
];

List<List<SalomonBottomBarItem>> _navBar = [
  [
    SalomonBottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text("Home"),
      selectedColor: Colors.purple,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.favorite_border),
      title: const Text("Likes"),
      selectedColor: Colors.pink,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.search),
      title: const Text("Search"),
      selectedColor: Colors.orange,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text("Profile"),
      selectedColor: Colors.teal,
    ),
  ],
  [
    SalomonBottomBarItem(
      icon: const Icon(Icons.abc),
      title: const Text("Home"),
      selectedColor: Colors.purple,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.favorite_border),
      title: const Text("Likes"),
      selectedColor: Colors.pink,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.search),
      title: const Text("Search"),
      selectedColor: Colors.orange,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text("Profile"),
      selectedColor: Colors.teal,
    ),
  ],
  [
    SalomonBottomBarItem(
      icon: const Icon(Icons.face),
      title: const Text("Home"),
      selectedColor: Colors.purple,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.favorite_border),
      title: const Text("Likes"),
      selectedColor: Colors.pink,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.search),
      title: const Text("Search"),
      selectedColor: Colors.orange,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text("Profile"),
      selectedColor: Colors.teal,
    ),
  ],
];
