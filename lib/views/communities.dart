import 'package:calmu/main.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  _CommunityState() {
    // shows our current stored theme key
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: SimpleAppBar(title: 'Communities')),
      ],
    )));
  }
}
