import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/controller/notes_controller.dart';
import 'package:getx/route/route_names.dart';
import 'package:getx/utils/colors.dart';
import 'package:getx/view/home/home.dart';
import 'package:intl/intl.dart';

class CustomSingleNotes extends StatelessWidget {
  final int index;
  const CustomSingleNotes({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NotesController>();

    final note = controller.notes.elementAt(index);
    final createdDateFormat = DateFormat.yMMMMd().format(note.createdDate);
    final createdTimeFormat = DateFormat.jm().format(note.createdDate);
    final updatedDateFormat = DateFormat.yMMMMd().format(
      note.updatedDate ?? DateTime.now(),
    );
    final updatedTimeFormat = DateFormat.jm().format(
      note.updatedDate ?? DateTime.now(),
    );
    return InkWell(
      onTap: () {
        Get.toNamed(
          RouteNames.noteScreen,
          arguments: {
            'isUpdate': true,
            'note': note,
            'index': index,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          horizontalTitleGap: 0,
          leading: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.backgroundColor,
            ),
          ),
          title: Text(
            note.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              note.updatedDate != null
                  ? Text(
                      '$updatedDateFormat - $updatedTimeFormat',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  : const SizedBox(),
              Text(
                note.description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$createdDateFormat - $createdTimeFormat',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              Get.snackbar("$index", "Deleted $index note");
              controller.deleteNote(index);
              Get.to(() => const HomeScreen());
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
