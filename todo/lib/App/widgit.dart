import 'package:flutter/material.dart';
import 'package:todo/App/constant.dart';

class listIcon extends StatelessWidget {
  const listIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        left: 30,
        right: 30,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          CircleAvatar(
            child: Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
              size: 40,
            ),
            backgroundColor: Colors.white,
            radius: 30.0,
          ),
          sizedBox,
          Text(
            'TODO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            ' 12 tasks to do',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          sizedBox
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTile(),
      ],
    );
  }
}

class TaskTile extends StatefulWidget {
  TaskTile({Key? key}) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    var checkBox = false;
    return ListTile(
      title: Text('first task'),
      trailing: Checkbox(
          value: true,
          onChanged: (value) {
            if (value == true) {
              setState(() {
                checkBox = value!;
              });
              print(value);
            } else {
              setState(() {
                checkBox = value!;
              });
              print(value);
            }
          }),
    );
  }
}
