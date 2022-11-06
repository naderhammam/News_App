import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'IT\'s MY SETTINGS ♥',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
