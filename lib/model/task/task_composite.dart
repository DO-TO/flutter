import 'package:do_to/model/task/task_component.dart';

class TaskComposite extends TaskComponent {
  // The composite of the task composite pattern

  List<TaskComponent> _taskComponents = [];

  @override
  int getProgress() {
    // get the progress of the composite
    // the progress is the minimum of the progress of the children
    int progress = TaskComponent.MAX_PROGRESS;
    for (TaskComponent taskComponent in _taskComponents) {
      progress = progress < taskComponent.getProgress()
          ? progress
          : taskComponent.getProgress();
    }
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
  List<TaskComponent> getChildren() {
    return _taskComponents;
  }
}