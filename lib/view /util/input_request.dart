import 'package:flutter/material.dart';

import '../../model/task/task_component.dart';
import '../../model/task/task_composite.dart';
import '../../model/task/task_leaf.dart';

class InputRequest {

  static Future<TaskComponent> getTaskInput({String title = "Create", String message = "Enter a name", required BuildContext context}) async {
    final TextEditingController _controller = TextEditingController();
    TaskComponent taskComponent = TaskLeaf();
    TaskComponent leave = TaskLeaf(), group = TaskComposite();
    await showDialog<String>(
      context: context, 
      builder: (BuildContext context){
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: message),
                    ),
                    // let the user choose whether the task is a leaf or a composite
                    
                    RadioListTile<TaskComponent>(
                      title: const Text('Task'),
                      value: leave,
                      groupValue: taskComponent,
                      onChanged: (TaskComponent? value) {
                        setState(() => taskComponent = value!);
                      },
                    ),
                    RadioListTile<TaskComponent>(
                      title: const Text('Group'),
                      value: group,
                      groupValue: taskComponent,
                      onChanged: (TaskComponent? value) {
                        setState(() => taskComponent = value!);
                      },
                    ),
                
              ]
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, _controller.text),
              child: const Text('Ok'),
            ),
          ],
        );
          }
        );
      }
    );
    taskComponent.setName(_controller.text);
    return taskComponent;
    }
  
}