import 'package:get/get.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/services/api_service.dart';

// TASK CONTROLLER CLASS MANAGES THE STATE
// AND BUSINESS LOGIC RELATED TO TASKS.
class TaskController extends GetxController {
  var tasks = <Task>[].obs; // Create an empty list of type Task
  var isLoading = true.obs; // Notify change
  var selectedFilter = 'All'.obs; // Selected filter
  var now = DateTime.now().obs; // Get the current date
  var formattedDate = ''.obs; // Formatted date string
  final _originalTasks = <Task>[].obs; // Original unfiltered list of tasks

  final ApiService _apiService =
      ApiService(); // Instance of ApiService to interact with API

  @override
  void onInit() {
    fetchTasks(); // Fetchs tasks from the API service
    now.value = DateTime.now();
    formattedDate.value =
        '${_getWeekday(now.value.weekday)}, ${now.value.day} ${_getMonth(now.value.month)}';
    super.onInit();
  }

  // Fetch tasks from API service
  void fetchTasks() async {
    isLoading(true); // Set loading state to true
    try {
      var tasksData = await _apiService.getTasks(); // Get tasks from API
      _originalTasks.assignAll(tasksData); // Assign tasks to the original list
      tasks.assignAll(tasksData); // Assign tasks to the observable list
    } finally {
      isLoading(false); // Set loading state to false
    }
  }

  // Toggle completion state of a task
  void taskDone(Task task) {
    task.completed = !task.completed; // Toggle completion state
    updateTask(task.id, task); // Update the task in the list
  }

  // Create a new task
  void createTask(Task task) async {
    var newTask = await _apiService.createTask(task); // Create task via API
    tasks.add(newTask); // Add the new task to list
  }

  // Update a task
  void updateTask(int id, Task updatedTask) {
    int index = tasks.indexWhere((task) => task.id == id); // Find index of task
    if (index != -1) {
      // If task exists in the list
      tasks[index] = updatedTask; // Update the task at the found index
      tasks.refresh(); // Refresh UI update
    }
  }

  // Delete a task
  void deleteTask(int id) async {
    await _apiService.deleteTask(id); // Delete task via API
    tasks.removeWhere((el) => el.id == id); // Remove task from the list
  }

  // Change filter button value
  void changeFilter(String filter) {
    selectedFilter.value = filter; // Update selected filter value
  }

  // Filter tasks based on selected filter
  List<Task> get filteredTasks {
    switch (selectedFilter.value) {
      case 'Pending':
        return tasks
            .where((task) => !task.completed)
            .toList(); // Return pending tasks
      case 'Completed':
        return tasks
            .where((task) => task.completed)
            .toList(); // Return completed tasks
      default:
        return tasks; // Return all tasks if no filter is selected
    }
  }

  // Get count of filtered tasks
  int get filteredTaskCount {
    return filteredTasks.length;
  }

  // Search tasks based on a search query
  void searchTask(String searchQuery) {
    if (searchQuery.isEmpty) {
      tasks.assignAll(_originalTasks);
    } else {
      tasks.assignAll(tasks.where((task) {
        return task.title.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList());
    }
  }

  // Get the week name
  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  // Get the month name
  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
