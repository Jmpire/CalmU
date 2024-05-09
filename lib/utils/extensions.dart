import 'package:flutter/material.dart';
import '../values/app_constants.dart';

extension NavigationThroughString on String {
  Future<dynamic> pushName(String title) async {
    return AppConstants.navigationKey.currentState?.pushNamed(
      this,
    );
  }
}

extension ContextExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  void showSnackBar(String? message, {bool isError = false}) =>
      ScaffoldMessenger.of(this)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.purple,
            content: Text(message ?? ''),
          ),
        );
}
