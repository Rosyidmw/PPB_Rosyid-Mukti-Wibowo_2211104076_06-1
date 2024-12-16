import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided_13/notes_controller.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final NotesController noteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              )
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi',  
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();
                if (title.isNotEmpty && description.isNotEmpty) {
                  noteController.addNote(title, description);
                  Get.back();
                } else {
                  noteController.snackBar();
                }
              },
              child: 
                Text('Simpan', style: TextStyle(color: Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey
                ),
            )
          ],
        ),
      ),
    );
  }
}