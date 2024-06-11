import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/controllers/task_controller.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/widgets/customButton.dart';
import 'package:todolist_app/widgets/textFormField.dart';
import '../utils/colors.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  // Initialize TaskController to manage tasks
  TaskController taskController = Get.find();

  // Title, description controller
  late TextEditingController titleEditController;
  late TextEditingController descEditController;

  @override
  void initState() {
    super.initState();
    titleEditController = TextEditingController(
        text: widget.task.title); // Initialize with task title
    descEditController = TextEditingController(
        text: widget.task.description); //initialize with task description
  }

  @override
  void dispose() {
    titleEditController.dispose(); // Dispose the title controller
    descEditController.dispose(); // Dispose the description controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDarkMode,
      appBar: AppBar(
        title: const Text(
          'Update Task',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.buttonColorDarkMode,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // FORM TO EDIT TITLE & DESCRIPTION
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title', // Label for the Title text field
                  style: TextStyle(
                    color: AppColors.whiteOpColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller:
                      titleEditController, // Connect the text field to the title controller
                  hintText: 'Enter title',
                  fontSize: 20,
                  textColor: AppColors.whiteColor,
                  maxLines: 1, // Allows the text to wrap and expand
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description', // Label for the description text field
                  style: TextStyle(
                    color: AppColors.whiteOpColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller:
                      descEditController, // Connect the text field to the description controller
                  hintText: 'Enter description',
                  fontSize: 20,
                  textColor: Colors.white,
                  maxLines: 1,
                ),
              ],
            ),
            // UPDATE & DELETE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    label: 'Delete', // Label for the delete button
                    textColor: AppColors.errorColor,
                    borderColor: AppColors.brandColor,
                    backgroundColor: AppColors.backgroundColorDarkMode,
                    onPressed: () {
                      taskController.deleteTask(widget.task.id);
                      Get.back(); // Navigate back to the previous screen
                      Get.snackbar(
                        "Delete🗑️", // Snackbar title
                        "Task successfully deleted", // Snackbar message
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Update', // Label for the update button
                    textColor: AppColors.greenColor,
                    borderColor: AppColors.brandColor,
                    backgroundColor: AppColors.backgroundColorDarkMode,
                    onPressed: () {
                      taskController.updateTask(
                        widget.task.id,
                        Task(
                          id: widget.task.id,
                          title: titleEditController
                              .text, // Update task title with new text
                          description: descEditController
                              .text, // Update description title with new text
                          completed: widget.task.completed,
                        ),
                      );
                      Get.snackbar(
                        "Success✅", // Snackbar title
                        "Task successfully updated", // Snackbar message
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 2),
                      );
                      Navigator.pop(
                          context); // Navigate back to the previous screen
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String upperFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
