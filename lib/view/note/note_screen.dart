import 'package:flutter/material.dart';
import 'package:getx/utils/colors.dart';
import 'package:getx/utils/custom_buttons.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: TextFormField(
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
            print("Save button");
          },
          textColor: AppColor.backgroundColor,
          height: 40,
          width: 10,
        ),
      ),
    );
  }
}
