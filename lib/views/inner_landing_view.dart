import 'package:flutter/material.dart';
import 'package:my_app_office/views/approvals_view.dart';
import 'package:my_app_office/views/home_view.dart';
import 'package:my_app_office/views/reports_view.dart';
import 'package:my_app_office/views/settings_view.dart';
import 'package:my_app_office/views/widgets/office/drawer_header.dart';
import 'package:my_app_office/views/widgets/office/drawer_list.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class OfficeView extends StatefulWidget {
  const OfficeView({super.key});

  @override
  State<OfficeView> createState() => _OfficeViewState();
}

class _OfficeViewState extends State<OfficeView> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 226, 233),
        appBar: AppBar(
          title: Text(_navbarPages[_selectedTabIndex].title),
          backgroundColor: Colors.blueAccent,
          elevation: 2,
          shadowColor: Colors.blueAccent,
        ),
        body: _navbarPages[_selectedTabIndex].body,
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: _selectedTabIndex,
            selectedItemColor: const Color(0xff6200ee),
            unselectedItemColor: Colors.blueGrey,
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            items: _navBarItems),
        drawer: Drawer(
          shadowColor: Colors.blueAccent,
          elevation: 2,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              OfficeDrawerHeader(),
              // --------------------------- Header
              OfficeDrawerList(),
            ],
          ),
        ),
      ),
    );
  }
}

const List<NavbarPage> _navbarPages = [
  NavbarPage(
    title: "Home",
    body: HomeView(),
  ),
  NavbarPage(
    title: "Salary",
    body: ApprovalView(),
  ),
  NavbarPage(
    title: "Report",
    body: ReportView(),
  ),
  NavbarPage(
    title: "Settings",
    body: SettingsView(),
  ),
];

class NavbarPage {
  final String title;
  final Widget body;

  const NavbarPage({
    required this.title,
    required this.body,
  });
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Home"),
    selectedColor: Colors.blue,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.fact_check),
    title: const Text("Approval"),
    selectedColor: Colors.blue,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.receipt),
    title: const Text("Report"),
    selectedColor: Colors.blue,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.settings),
    title: const Text("Settings"),
    selectedColor: Colors.blue,
  ),
];
