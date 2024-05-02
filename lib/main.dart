import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app_office/firebase_options.dart';
import 'package:my_app_office/route.dart';
import 'package:my_app_office/views/approvals_view.dart';
import 'package:my_app_office/views/home_view.dart';
import 'package:my_app_office/views/reports_view.dart';
import 'package:my_app_office/views/settings_view.dart';
import 'package:my_app_office/views/widgets/office/drawer_header.dart';
import 'package:my_app_office/views/widgets/office/drawer_list.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: const OfficeView(),
      routes: route,
    );
  }
}

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
        appBar: AppBar(
          title: Text(_navbarPages[_selectedTabIndex].title),
        ),
        body: _navbarPages[_selectedTabIndex].body,
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: _selectedTabIndex,
            selectedItemColor: const Color(0xff6200ee),
            unselectedItemColor: const Color(0xff757575),
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            items: _navBarItems),
        drawer: Drawer(
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
    title: "Approval",
    body: ApprovalView(),
  ),
  NavbarPage(
    title: "Report",
    body: ReportView(),
  ),
  NavbarPage(
    title: "Setting",
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
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.approval),
    title: const Text("Approval"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.receipt),
    title: const Text("Report"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.settings),
    title: const Text("Setting"),
    selectedColor: Colors.teal,
  ),
];
