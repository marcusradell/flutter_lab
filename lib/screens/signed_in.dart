import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignedInScreen extends StatefulWidget {
  final int index = 0;

  const SignedInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignedInScreen();
}

class _SignedInScreen extends State<SignedInScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SignedInScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.index;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          title: Text((context as Element)
              .findAncestorWidgetOfExactType<MaterialApp>()!
              .title),
          bottom: TabBar(
              controller: _tabController,
              tabs: [
                for (final i in ["home", "insights", "me"])
                  Tab(text: i.toString())
              ],
              onTap: (i) => context
                  .goNamed("measurement", params: {'id': i.toString()}))));
}
