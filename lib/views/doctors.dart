import 'package:calmu/main.dart';
import 'package:flutter/material.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  _DoctorState() {
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
            child: SimpleAppBar(title: 'Doctors')),
      ],
    )));
  }
}
