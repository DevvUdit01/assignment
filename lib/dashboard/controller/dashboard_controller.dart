import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  // Date Selection
  final selectedDate = DateTime.now().obs;
  final dates = List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat.E();
    return formatter.format(date);
  }

  // Sample Tasks
  final tasks = [
    {'name': 'Meta Work Project', 'progress': 56, 'dueDate': '16 Oct 2022'},
    {'name': '3D Design', 'progress': 78, 'dueDate': '18 Oct 2022'},
  ].obs;
}
