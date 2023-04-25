import 'package:flutter/material.dart';
import 'package:image_picker_saver/screens/home.dart';
import 'package:image_picker_saver/services/state.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MaterialApp(
        title: 'Image Picker Saver',
        home: HomeScreen(),
      ),
    );
  }
}
