import 'package:calmu/main.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _ProfileState() {
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
            child: SimpleAppBar(title: 'Profile')),
      ],
    )));
  }
}
