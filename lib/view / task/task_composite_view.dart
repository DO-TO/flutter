import 'package:do_to/model/task/task_component.dart';
import 'package:do_to/view%20/%20task/task_component_view.dart';
import 'package:flutter/material.dart';

import '../../model/task/task_composite.dart';
import '../../model/task/task_leaf.dart';

class TaskCompositeView extends TaskComponentView {
  final TaskComponent component;
  const TaskCompositeView({Key? key, required this.component}) : super(key: key);

  @override
  State<TaskComponentView> createState() => _TaskListState(component);
}

class _TaskListState extends TaskComponentViewState {
  TaskComponent taskList;
  _TaskListState(this.taskList);

  List<TaskComponentView> taskViews = [];
  void addChildLeaf() {
    setState(() {
      taskList.add(TaskLeaf());
    });
  }

  void addTaskGroup() {
    setState(() {
      taskList.add(TaskComposite());
    });
  }

  @override
  Widget build(BuildContext context) {
    // create an expandable and collapsable list of tasks in the taskList
    return ExpansionTile(
      title: Row(
        children: [Text(taskList.name),
                  const SizedBox(width: 10),
                  Text(taskList.getProgress().toString()),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: addChildLeaf,
                    icon: const Icon(Icons.add),
                  ),  
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: addTaskGroup,
                    icon: const Icon(Icons.add),
                  ),
                  ]

        ),
      children: taskList.getChildren().map((task) => task.getTaskComponentView()).toList(),
    );
    /*return Scaffold(
      appBar: AppBar(
        title: Text(taskList.name),
        actions: [
          IconButton(
            onPressed: addChildLeaf,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: taskList.getChildren().length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(taskList.name),
            children: taskList.getChildren().map((task) => task.getTaskComponentView()).toList(),
          );
        },
      ),
    );*/
  }
}