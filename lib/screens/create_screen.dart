import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/controllers/task_controller.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/utils/colors.dart';
import 'package:todolist_app/widgets/customButton.dart';
import 'package:todolist_app/widgets/textFormField.dart';

// Task create screen
class CreateScreen extends StatelessWidget {
  CreateScreen({super.key});

  // Initialize TaskController to manage tasks
  final TaskController taskController = Get.find();
  final TextEditingController titleController =
      TextEditingController(); // Title text field
  final TextEditingController descriptionController =
      TextEditingController(); // Description text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDarkMode,
      appBar: AppBar(
        title: const Text(
          'Create Task',
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
            // FORM TO CREATE TITLE & DESCRIPTION
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    color: AppColors.whiteOpColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: titleController,
                  hintText: 'Enter title',
                  fontSize: 24,
                  textColor: AppColors.whiteColor,
                  maxLines: 1,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description',
                  style: TextStyle(
                    color: AppColors.whiteOpColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: descriptionController,
                  hintText: 'Enter description',
                  fontSize: 20,
                  textColor: AppColors.whiteColor,
                  maxLines: 1,
                ),
              ],
            ),
            // CREATE & CANCEL TASKS BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    label: 'Cancel',
                    textColor: AppColors.errorColor,
                    borderColor: AppColors.brandColor,
                    backgroundColor: AppColors.backgroundColorDarkMode,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  CustomButton(
                    label: 'Create',
                    textColor: AppColors.greenColor,
                    borderColor: AppColors.brandColor,
                    backgroundColor: AppColors.backgroundColorDarkMode,
                    onPressed: () {
                      Task newTask = Task(
                        id: 0,
                        title: titleController.text,
                        description: descriptionController.text,
                        completed: false,
                      );
                      taskController.createTask(newTask);
                      // print('Title: ${newTask.title}');
                      // Show a success message using Get.snackbar
                      Get.snackbar(
                        "Success👏✅",
                        "Task successfully created",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 2),
                      );
                      Navigator.pop(context); // Navigate back previous screen
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
}
