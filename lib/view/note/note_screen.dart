import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/notes_controller.dart';
import 'package:getx/models/notes_model.dart';
import 'package:getx/route/route_names.dart';
import 'package:getx/utils/colors.dart';
import 'package:getx/utils/custom_buttons.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final notesAdded = Get.put(NotesController());

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.backgroundColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.link),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                minLines: 10,
                maxLines: 50,
                decoration: const InputDecoration(
                    hintText: "Description",
                    border: InputBorder.none,
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 150, right: 150, bottom: 50, top: 0),
        child: CustomButton(
          text: "Save here",
          onPressed: () {
            if (titleController.text.isEmpty ||
                descriptionController.text.isEmpty) {
              Get.snackbar(
                "Error",
                "Title or Description is EMPTY",
              );
            } else {
              notesAdded.addNotes(
                NotesModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  createdDate: DateTime.now(),
                ),
              );
            }
            Get.back();
          },
          textColor: AppColor.backgroundColor,
          height: 40,
          width: 10,
        ),
      ),
    );
  }
}
