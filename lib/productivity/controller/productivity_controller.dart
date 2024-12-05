import 'package:get/get.dart';

class ProductivityController extends GetxController {
  // List of tasks
  

  // List of subtasks
  final List<Subtask> subtasks = [
    Subtask(
      title: 'App Design', 
      isCompleted: true, 
       assigneeImages: [
        'assets/images/user1.jpg',
        ],
      ),

    Subtask(
      title: 'UI/UX', 
     isCompleted: true, 
     assigneeImages: [
        'assets/images/user1.jpg',
        'assets/images/user1.jpg',
        'assets/images/user1.jpg',
        ],
      ),

    Subtask(
     title: '3D Animation', 
     isCompleted: true,
      assigneeImages: [
        'assets/images/user1.jpg',
        ],
      ),

    Subtask(title: 'Landing page', 
     isCompleted: true, 
     assigneeImages: [
        'assets/images/user1.jpg',
        'assets/images/user1.jpg',
        ],
      ),
  ].obs;

  

  // Add a new subtask
   void addSubtask(String title) {
    subtasks.add(Subtask(
      title: title,
      isCompleted: false,
      assigneeImages: [ 'assets/images/user1.jpg','assets/images/user1.jpg',],
    ));
    update(); // Notify UI to rebuild
  }

  // Edit an existing subtask
  // void editSubtask(int index, String newTitle, {String? newAssigneeImage}) {
  //   subtasks[index].title = newTitle;
  //   subtasks[index].assigneeImage = newAssigneeImage;
  //   update(); // Notify the UI to rebuild
  // }

  // Delete a subtask
  void deleteSubtask(int index) {
    subtasks.removeAt(index);
    update(); // Notify the UI to rebuild
  }
}

// Model for a task
class Task {
  String title;
  bool isCompleted;
  DateTime? dueDate;

  Task({
    required this.title,
    this.isCompleted = false,
    this.dueDate,
  });
}

// Model for a subtask
class Subtask {
  String title;
  bool isCompleted;
  List<String> assigneeImages;

  Subtask({
    required this.title,
    required this.isCompleted,
    required this.assigneeImages,
  });
}

// class Assignee {
//   String name;
//   String image; // Path to avatar image

//   Assignee({required this.name, required this.image});
// }