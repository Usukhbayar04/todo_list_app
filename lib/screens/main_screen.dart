import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/controllers/task_controller.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/screens/create_screen.dart';
import 'package:todolist_app/utils/colors.dart';
import 'package:todolist_app/widgets/cardItem.dart';
import 'package:todolist_app/widgets/filterButton.dart';
import '../utils/fonts.dart';

// DISPLAY THE TO-DO LIST ON THE HOME PAGE, FILTER, AND CREATE TASKS.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize TaskController to manage tasks
  final TaskController taskController = Get.put(TaskController());
  bool modeToggle = true;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: modeToggle
          ? AppColors.backgroundColorDarkMode
          : AppColors.backgroundColorLightMode,
      body: Obx(
        () {
          if (taskController.isLoading.value) {
            // If tasks are loading, show loading indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, left: 20.0, right: 20.0, bottom: 6),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // HEADER
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Profile image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset('assets/profile.png',
                                      width: 45, height: 45),
                                ),
                                const SizedBox(width: 15),
                                // Name and Date
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi Usukhbayar',
                                      style: AppFonts.bodyText(context),
                                    ),
                                    Text(
                                      taskController.formattedDate.toString(),
                                      style: AppFonts.bodyText2Op(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Dark and Light mode toggle
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle mode
                                  modeToggle = !modeToggle;
                                });
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColorDarkMode,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                  child: Icon(
                                    modeToggle
                                        ? Icons.dark_mode
                                        : Icons.light_mode,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // FILTER BUTTONS
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.buttonColorDarkMode,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FilterButton(
                                  text: 'All',
                                  isSelected:
                                      taskController.selectedFilter.value ==
                                          'All',
                                  onTap: () =>
                                      taskController.changeFilter('All'),
                                ),
                                FilterButton(
                                  text: 'Pending',
                                  isSelected:
                                      taskController.selectedFilter.value ==
                                          'Pending',
                                  onTap: () =>
                                      taskController.changeFilter('Pending'),
                                ),
                                FilterButton(
                                  text: 'Completed',
                                  isSelected:
                                      taskController.selectedFilter.value ==
                                          'Completed',
                                  onTap: () =>
                                      taskController.changeFilter('Completed'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // TASK LIST
                        Expanded(
                          child: ListView.builder(
                            itemCount: taskController.filteredTaskCount,
                            itemBuilder: (context, index) {
                              Task task = taskController.filteredTasks[index];
                              return cardItem(task, index);
                            },
                          ),
                        ),
                      ],
                    ),
                    // BOTTOM NAVIGATION BAR & CREATE BUTTON
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Bottom navigation bar items
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColorDarkMode,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(40),
                              ),
                              border: Border.all(
                                color: AppColors.brandOpColor,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Home page
                                IconButton(
                                  icon: const Icon(
                                    Icons.home,
                                    color: AppColors.whiteOpColor,
                                    size: 29,
                                  ),
                                  onPressed: () {
                                    Get.to(const HomePage());
                                  },
                                ),
                                const SizedBox(width: 20),
                                // Search dialog
                                IconButton(
                                  icon: const Icon(
                                    Icons.search_outlined,
                                    color: AppColors.whiteOpColor,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    // Show a dialog for search input
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Search 🔍',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          content: const TextField(
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Enter your search task',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            // Cancel button
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            // Search button
                                            ElevatedButton(
                                              onPressed: () {
                                                // Perform search
                                                String searchTask =
                                                    searchController.text;
                                                taskController
                                                    .searchTask(searchTask);
                                                if (kDebugMode) {
                                                  print(
                                                      'Search task: ${(searchTask.toString())}');
                                                }
                                                Get.back();
                                              },
                                              child: const Text('Search'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          // Create task button
                          GestureDetector(
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: AppColors.brandColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.whiteOpColor,
                                  width: 8.0,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.whiteColor,
                                  size: 45,
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(() =>
                                  CreateScreen()); // Navigate to create screen
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
        },
      ),
    );
  }
}
