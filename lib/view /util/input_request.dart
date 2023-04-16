import 'package:flutter/material.dart';

import '../../model/task/task_component.dart';
import '../../model/task/task_composite.dart';
import '../../model/task/task_leaf.dart';

class InputRequest {

  static Future<TaskComponent?> getTaskInput({String title = "Create", String message = "Enter a name", required BuildContext context}) async {
    final TextEditingController _controller = TextEditingController();
    TaskComponent taskComponent = TaskLeaf();
    TaskComponent leave = TaskLeaf(), group = TaskComposite();

    bool _showError = false;

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
                      onChanged: (value) => {
                        if (_showError && value.isNotEmpty) {
                          setState(() => _showError = false)
                        }
                      },
                    ),
                    if (_showError)
                      const SizedBox(height: 10,),
                    if (_showError)
                      const Text(
                        'Please enter a name',
                        style: TextStyle(color: Colors.red),
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
              onPressed: () {
                _controller.text = '';
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text.isEmpty) {
                  // Display error message
                  setState(() => _showError = true);
                } else {
                  Navigator.pop(context, _controller.text);
                }
              },
              child: const Text('Ok'),
            ),
          ],
        );
          }
        );
      }
    );
    if (_controller.text.isEmpty) {
      return null;
    }
    taskComponent.setName(_controller.text);
    return taskComponent;
    }
  
}