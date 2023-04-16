import 'package:do_to/model/task/task_component.dart';
import 'package:do_to/view%20/%20task/task_composite_view.dart';
import 'package:do_to/view%20/%20task/task_leaf_view.dart';

import '../../view / task/task_component_view.dart';

class TaskComposite extends TaskComponent {
  // The composite of the task composite pattern

  final List<TaskComponent> _taskComponents = [];
  // ignore: constant_identifier_names
  static const String TYPE = 'composite';

  @override
  int getProgress() {
    // get the progress of the composite
    // the progress is the minimum of the progress of the children
    int progress = TaskComponent.MAX_PROGRESS + 1;
    for (TaskComponent taskComponent in _taskComponents) {
      progress = progress < taskComponent.getProgress()
          ? progress
          : taskComponent.getProgress();
    }
    progress = progress > TaskComponent.MAX_PROGRESS
        ? 0 : progress;
    return progress;
  }

  @override
  void add(TaskComponent taskComponent) {
    // add a child to the composite
    _taskComponents.add(taskComponent);
  }

  @override
  void remove(TaskComponent taskComponent) {
    // remove a child from the composite
    _taskComponents.remove(taskComponent);
  }

  @override
  void changeProgress(int progress) {
    // change the progress of the composite
    // the progress of the children is changed accordingly
    for (TaskComponent taskComponent in _taskComponents) {
      taskComponent.changeProgress(progress);
    }
  }

  @override
  void incrementProgress(int progress) {
    // increment the progress of the composite
    // the progress of the children is changed accordingly
    for (TaskComponent taskComponent in _taskComponents) {
      taskComponent.incrementProgress(progress);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    // convert the composite to a json object
    List<Map<String, dynamic>> taskComponents = [];
    for (TaskComponent taskComponent in _taskComponents) {
      taskComponents.add(taskComponent.toJson());
    }
    return {
      'name': name,
      'type': TYPE,
      'taskComponents': taskComponents,
    };
  }
  
  @override
  List<TaskComponent> getChildren() {
    return _taskComponents;
  }

  @override
  TaskComponentView getTaskComponentView() {
    return TaskCompositeView(component: this);
  }
}