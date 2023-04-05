import 'package:do_to/model/task/task_leaf.dart';
import 'package:do_to/view%20/%20task/task_component_view.dart';
import 'package:flutter/material.dart';

import '../../model/task/task_component.dart';

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

  void decrementProgress(int progress) {
    incrementProgress(-progress);
  }

  void changeProgress(int progress) {
    setState(() {
      task.changeProgress(progress);
    });
  }

  Row createWidget() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Text("${task.getName()}: "),
        Text(task.getProgress().toString()),
        // create gap between the text and the button
        const Spacer(),
        IconButton(
          onPressed: () {
            incrementProgress(1);
          },
          icon: const Icon(Icons.done),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {
            decrementProgress(1);
          },
          icon: const Icon(Icons.undo),
        ),
      ],
    );
  }
  Row createWidgetWithSlider() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: Text(task.getName(),
            softWrap: true,
            overflow: TextOverflow.clip
          )
        ),
        const Spacer(),
        //Text(task.getProgress().toString()),
        // create gap between the text and the button
        //const Spacer(),
        Expanded(
          flex: 3,
          child: Slider(
              max: TaskComponent.MAX_PROGRESS.toDouble(),
              value: task.getProgress().toDouble(),
              onChanged: (value) {
                changeProgress(value.toInt());
              },
            )
        ),
        IconButton(
          onPressed: () {
            incrementProgress(10);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // create a simple task view with the name of the task and its progress, and a button to mark it as done
    return Card(
      elevation: 0,
      //margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Color.fromARGB(127, 255, 255, 255),
      child: createWidgetWithSlider(),
    );
  }
}