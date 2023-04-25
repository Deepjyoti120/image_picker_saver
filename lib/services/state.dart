import 'dart:io';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  List<File> _files = [];
  List<File> _filesSaved = [];
  bool _refresh = false;

  List<File> get files => _files;
  List<File> get filesSaved => _filesSaved;
  bool get refresh => _refresh;

  set files(List<File> files) {
    _files = files;
    notifyListeners();
  }

  set filesSaved(List<File> filesSaved) {
    _filesSaved = filesSaved;
    notifyListeners();
  }

  set refresh(bool refresh) {
    _refresh = refresh;
    notifyListeners();
  }
}
