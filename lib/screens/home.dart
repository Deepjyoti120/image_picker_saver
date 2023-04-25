import 'package:flutter/material.dart';
import 'package:image_picker_saver/screens/image_view_save.dart';
import 'package:image_picker_saver/services/image_saver_services.dart';
import 'package:image_picker_saver/services/state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Pick Save'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ImagePickSaveService().imagePicker().then((value) {
            if (value != null) {
              appState.files.add(value);
              appState.refresh = !appState.refresh;
            }
          });
        },
        child: const Icon(Icons.photo),
      ),
      body: appState.files.isNotEmpty
          ? GridView.builder(
              itemCount: appState.files.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              padding: const EdgeInsets.all(12),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final img = appState.files[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageViewSave(img: img),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6)),
                        child: Image.file(img),
                      ),
                      if (appState.filesSaved.contains(img))
                        const Icon(
                          Icons.done,
                          color: Colors.green,
                        )
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'No Images \nPlease Click on Floating Button',
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
