import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/controllers/task_controller.dart';
import 'package:todolist_app/models/task.dart';
import '../screens/details_screen.dart';
import '../utils/colors.dart';

// DISPLAY TASK ITEM CARD WIDGET
Widget cardItem(Task task, int index) {
  final taskController = Get.put(TaskController()); // Access the TaskController
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: GestureDetector(
      child: Container(
        width: 380, // Width of the task card
        height: 80, // Height of the task card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: AppColors.buttonColorDarkMode, // Background color of card
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  upperFirstLetter(task.title),
                  style: TextStyle(
                    color: task.completed
                        ? AppColors.whiteOpColor
                        : AppColors.whiteColor,
                    fontSize: 16,
                    decoration: task.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
              IconButton(
                icon: Icon(
                  task.completed ? Icons.check : null,
                  color: task.completed ? AppColors.greenColor : null,
                  size: 25,
                ),
                onPressed: () {
                  taskController.taskDone(task);
                  if (task.completed) {
                    Get.snackbar(
                      "Done👏😎",
                      "Task completed successfully.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  }
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: task.completed
                            ? AppColors.greenColor
                            : AppColors.errorColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => Get.to(
        () => TaskDetailScreen(task: taskController.tasks[index]),
      ),
    ),
  );
}

// Capitalize  first letter of a string.
String upperFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}
