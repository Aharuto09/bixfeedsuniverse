import 'package:bixfeeds_network_universe/presentation/pages/Home_Page.dart';
import 'package:bixfeeds_network_universe/presentation/pages/Teams_Page.dart';
import 'package:bixfeeds_network_universe/presentation/widgets/navigation.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final PageController _controller = PageController();
  double _currentPage = 0;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currentPage = 0 + _controller.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: [
            const HomePage(),
            const TeamsPage(),
            Container(
              color: Colors.transparent,
            ),
            Container(
              color: Colors.transparent,
            ),
          ],
        ),
        Navigation(
          current: _currentPage,
          controller: _controller,
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentPage = 1;
          });
        },
        backgroundColor: Colors.amber,
      ),
    );
  }
}
