import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker_saver/services/image_saver_services.dart';
import 'package:image_picker_saver/services/state.dart';
import 'package:provider/provider.dart';

class ImageViewSave extends StatefulWidget {
  const ImageViewSave({super.key, required this.img});
  final File img;
  @override
  State<ImageViewSave> createState() => _ImageViewSaveState();
}

class _ImageViewSaveState extends State<ImageViewSave> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: InteractiveViewer(
              child: Image.file(
                widget.img,
              ),
            ),
          ),
          if (isSaved)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  Text('Saved on yout Gallery') // worked as expected 
                ],
              ),
            )
        ],
      ), // InteractiveViewer For Zooming
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ImagePickSaveService()
              .imageSaver(widget.img.path)
              .then((value) {
            if (value) {
              appState.filesSaved.add(widget
                  .img); // to check is image saved or not on main home screen
              appState.refresh = !appState.refresh;
              /* in list provider not listes or update thats why i refress this 
                  provider state its and  worked i have no idea when i add items on list 
                  then provider not changed anything on ui */
              setState(() => isSaved = true);
            }
          });
        },
        child: const Icon(Icons.photo),
      ),
    );
  }
}
