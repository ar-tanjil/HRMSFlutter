import 'package:flutter/material.dart';
import 'package:my_app_office/views/widgets/home/cleander_widget.dart';
import 'package:my_app_office/views/widgets/home/column1.dart';
import 'package:my_app_office/views/widgets/home/column2.dart';
import 'package:my_app_office/views/widgets/home/column3.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeFirstColumn(),
          HomeSecondColumn(),
          HomeThirdColumn(),
          CalenderWidget(),
        ],
      ),
    ));
  }
}
