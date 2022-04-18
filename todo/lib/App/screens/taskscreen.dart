import 'package:flutter/material.dart';
import 'package:todo/App/constant.dart';
import 'package:todo/App/screens/addTaskScreen.dart';

import '../widgit.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: builder,
                backgroundColor: Colors.transparent);
          },
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            listIcon(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: boxDecoration,
                child: TaskList(),
              ),
            ),
          ],
        ),
        //
      ),
    );
  }
}
