import 'package:do_to/model/task/task_component.dart';

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
  List<TaskComponent> getChildren() {
    // return an empty list
    return [];
  }
}