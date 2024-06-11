// Task represents a single task item.
class Task {
  int id; // Unique identifier for the task.
  String title; // Title of the task
  bool completed; // Indicates whether the task is completed or not.
  String? description; // Optional description of the task.

  // Constructor for creating a Task instance.
  Task({
    required this.id, // Required parameter: id
    required this.title, // Required parameter: title
    required this.completed, // Required parameter: completed
    this.description, // Optional parameter: description
  });

  // Factory method to create a Task from JSON data.
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'], // Extract id from JSON
      title: json['title'], // Extract title from JSON
      completed: json['completed'], // Extract completed from JSON
      description: json['description'], // Extract description from JSON
    );
  }

  // Converts a Task object to a JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Add id to JSON
      'title': title, // Add title to JSON
      'completed': completed, // Add completed to JSON
      'description': description, // Add description to JSON
    };
  }
}
