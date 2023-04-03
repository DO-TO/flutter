import 'package:do_to/model/task/task_leaf.dart';
import 'package:do_to/view%20/%20task/task_component_view.dart';
import 'package:flutter/material.dart';

class TaskLeafView extends TaskComponentView {
  final TaskLeaf task;
  const TaskLeafView({Key? key, required this.task}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<TaskComponentView> createState() => _TaskLeafViewState(task);
}

class _TaskLeafViewState extends TaskComponentViewState {
  final TaskLeaf task;

  _TaskLeafViewState(this.task);

  void incrementProgress(int progress) {
    setState(() {
      task.incrementProgress(progress);
    });
  }

  @override
  Widget build(BuildContext context) {
    // create a simple task view with the name of the task and its progress, and a button to mark it as done
    return Row(
      children: [
        Text("${task.getName()}: "),
        Text(task.getProgress().toString()),
        // create gap between the text and the button
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {
            incrementProgress(1);
          },
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }
}