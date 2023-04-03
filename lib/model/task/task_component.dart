import 'package:do_to/view%20/%20task/task_component_view.dart';

abstract class TaskComponent {
  // The compononent of the task composite pattern

  String name = 'default name';
  // ignore: constant_identifier_names
  static const int MAX_PROGRESS = 100;
  // ignore: constant_identifier_names
  static const int MIN_PROGRESS = 0;

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

  TaskComponentView getTaskComponentView();
  
}