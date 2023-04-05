import 'package:do_to/model/task/task_component.dart';
import 'package:do_to/view%20/%20task/task_component_view.dart';
import 'package:do_to/view%20/util/input_request.dart';
import 'package:flutter/material.dart';

import '../../model/task/task_composite.dart';
import '../../model/task/task_leaf.dart';

class TaskCompositeView extends TaskComponentView {
  final TaskComponent component;
  const TaskCompositeView({Key? key, required this.component}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<TaskComponentView> createState() => _TaskListState(component);
}

class _TaskListState extends TaskComponentViewState {
  TaskComponent taskList;
  _TaskListState(this.taskList);

  List<TaskComponentView> taskViews = [];

  void addTask() {
    Future<TaskComponent> task = InputRequest.getTaskInput(context: context);
    task.then((value) => setState(() {
      taskList.add(value);
    }));
  }

  ExpansionTile getTaskComponentView() {
    return ExpansionTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
                    "${taskList.name} - ${taskList.getProgress()}/${TaskComponent.MAX_PROGRESS}",
                    softWrap: true,
                    overflow: TextOverflow.clip)
            ),
          const SizedBox(width: 10),
          //const Spacer(),
          Expanded(
            child: 
            LinearProgressIndicator(
              value: taskList.getProgress() / TaskComponent.MAX_PROGRESS,
            )
          ),
          //Text(taskList.getProgress().toString()),
          //const Spacer(),
          IconButton(
            onPressed: addTask,
            icon: const Icon(Icons.add),
          ),  
                  
                  ]
        ),

      tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      //backgroundColor: Color.fromARGB(2, 65, 65, 65),

      onExpansionChanged: (value) => setState((){}),
      children: taskList.getChildren().map((task) => 
        Padding(padding: const EdgeInsets.only(left: 16.0),
              child: task.getTaskComponentView())).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // create an expandable and collapsable list of tasks in the taskList
    // create a card with a slight shadow and space to the previous card around the list
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //surfaceTintColor: Theme.of(context).cardColor,
      color: Color.fromARGB(100, 255, 255, 255),
      child: getTaskComponentView(),
    );
  }
}