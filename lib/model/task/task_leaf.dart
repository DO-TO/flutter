import 'package:do_to/model/task/task_component.dart';

import '../../view / task/task_component_view.dart';
import '../../view / task/task_leaf_view.dart';

class TaskLeaf extends TaskComponent {
  // The leaf of the task composite pattern

  int progress = 0;

  @override
  int getProgress() {
    // get the progress of the leaf
    return progress;
  }

  @override
  void add(TaskComponent taskComponent) {
    // do nothing
  }

  @override
  void remove(TaskComponent taskComponent) {
    // do nothing
  }

  @override
  void changeProgress(int progress) {
    // change the progress of the leaf
    this.progress = progress;
  }

  @override
  void incrementProgress(int progress) {
    // increment the progress of the leaf
    if (this.progress + progress > TaskComponent.MAX_PROGRESS) {
      this.progress = TaskComponent.MAX_PROGRESS;
    } else if (this.progress + progress < TaskComponent.MIN_PROGRESS) {
      this.progress = TaskComponent.MIN_PROGRESS;
    } else {
      this.progress += progress;
    }
  }

  @override
  List<TaskComponent> getChildren() {
    // return an empty list
    return [];
  }

  @override
  TaskComponentView getTaskComponentView() {
    return TaskLeafView(task: this);
  }
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}