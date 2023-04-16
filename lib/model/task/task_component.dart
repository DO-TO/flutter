import 'package:do_to/view%20/%20task/task_component_view.dart';

abstract class TaskComponent {
  // The compononent of the task composite pattern

  String name = 'default name';
  // ignore: constant_identifier_names
  static const int MAX_PROGRESS = 100;
  // ignore: constant_identifier_names
  static const int MIN_PROGRESS = 0;

  final List<TaskComponentViewState> _taskComponentViewStates = [];

  int getProgress();
  void add(TaskComponent taskComponent);
  void remove(TaskComponent taskComponent);
  void changeProgress(int progress);
  void incrementProgress(int progress);
  List<TaskComponent> getChildren();

  String getName(){
    return name;
  }
  void setName(String name){
    this.name = name;
  }

  Map<String, dynamic> toJson();

  TaskComponentView getTaskComponentView();

  void subscribe(TaskComponentViewState taskComponentViewState) {
    // subscribe the view state to the children
    _taskComponentViewStates.add(taskComponentViewState);
  }

  void unsubscribe(TaskComponentViewState taskComponentViewState) {
    // unsubscribe the view state from the children
    _taskComponentViewStates.remove(taskComponentViewState);
  }

  void notify() {
    // notify the view states of the children
    for (TaskComponentViewState taskComponentViewState in _taskComponentViewStates) {
      taskComponentViewState.update();
    }
  }
  
}