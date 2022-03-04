import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const tabs = ['home', 'insights', 'me'];

class HomeScreen extends StatefulWidget {
  final String selectedTab;

  const HomeScreen({required this.selectedTab, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: tabs.length,
        vsync: this,
        initialIndex:
            tabs.indexWhere((element) => element == widget.selectedTab));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index =
        tabs.indexWhere((element) => element == widget.selectedTab);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          title: Text((context as Element)
              .findAncestorWidgetOfExactType<MaterialApp>()!
              .title),
          bottom: TabBar(
              controller: _tabController,
              tabs: [for (final tab in tabs) Tab(text: tab)],
              onTap: (i) =>
                  context.goNamed("private", params: {'tab': tabs[i]}))));
}
