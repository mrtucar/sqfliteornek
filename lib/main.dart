import 'package:flutter/material.dart';
import 'screens/note_screen.dart';
import 'screens/notes_screen.dart';

void main() {
  String bilgi = "Test";
  runApp(MaterialApp(
    title: "Uygulamam",
    home:NotesScreen(),
  ));
}
