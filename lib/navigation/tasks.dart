import 'package:do_to/model/task/task_composite.dart';
import 'package:do_to/model/task/task_manager.dart';
import 'package:do_to/view%20/util/input_request.dart';
import 'package:flutter/material.dart';

import '../model/task/task_component.dart';
import '../model/task/task_leaf.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);
  
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}


class _TaskScreenState extends State<TaskScreen> {
  TaskManager taskManager = TaskManager();

  void addTask() {
    Future<TaskComponent?> task = InputRequest.getTaskInput(context: context);

    task.then(
      // 
      (value) => {
        if (value != null){
          setState(() => taskManager.add(value)),
        }
      });
    taskManager.notify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          //todo: display the tasks using composite pattern for the widgets as well.
          children: taskManager.getChildren().map((task) => task.getTaskComponentView()).toList(),
      ),
      

        floatingActionButton: FloatingActionButton(
          onPressed: addTask,
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
        );
    
  }
}