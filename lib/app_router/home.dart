import 'package:flutter/material.dart';
import 'package:flutter_lab/app_router/sign_in_status.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const tabs = ['home', 'insights', 'me'];

class HomeScreen extends StatefulWidget {
  final String selectedTab;

  const HomeScreen({required this.selectedTab, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    var page = tabs.indexWhere((element) => widget.selectedTab == element);

    _pageController = PageController(initialPage: page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    var page = tabs.indexWhere((element) => element == widget.selectedTab);
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 400), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) => context.goNamed("private", params: {'tab': tabs[i]}),
          currentIndex:
              tabs.indexWhere((element) => widget.selectedTab == element),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), label: 'insights'),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'me')
          ]),
      body: PageView(controller: _pageController, children: [
        Center(
            child: Column(
          children: [
            const Text('Home'),
            ElevatedButton(
                onPressed: () {
                  context.goNamed('private', params: {'tab': 'insights'});
                },
                child: const Text('Go to insights'))
          ],
        )),
        const Center(child: Text('Insights')),
        Center(
            child: Column(
          children: [
            const Text('Me'),
            ElevatedButton(
                onPressed: () {
                  context.read<SignInStatus>().isSignedIn = false;
                },
                child: const Text('Sign out'))
          ],
        ))
      ]));
}
