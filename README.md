# To Do List App

## A simple and intuitive Todo List app to help you organize your tasks efficiently.

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)]([https://github.com/Usukhbayar04/todolist_app/](https://github.com/Usukhbayar04/todo_list_app.git))

![Screenshot 1](https://github.com/Usukhbayar04/todo_list_app/blob/master/sc1.png)
![Screenshot 2](https://github.com/Usukhbayar04/todo_list_app/blob/master/sc2.png)

## Features

- Add tasks with title and description
- Mark tasks as completed
- Edit existing tasks
- Delete tasks
- Filter tasks by status (All, Pending, Completed)

## Tech Stack

The Todo List app uses a number of open source packages and tools:

- [Flutter](https://flutter.dev/) - UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase
- [GetX](https://pub.dev/packages/get) - State management, dependency injection, and route management
- [Dio](https://pub.dev/packages/dio) - Powerful HTTP client for Dart
- [JSONPlaceholder](https://jsonplaceholder.typicode.com/todos/) - Fake Online REST API for Testing and Prototyping

## Directory Structure

```
todo_list_app/
|-- android/            # Android-specific files (generated by Flutter)
|-- ios/                # iOS-specific files (generated by Flutter)
|-- lib/                # Source code files
|   |-- controllers/    # Controllers for managing app logic
|   |-- models/         # Data models
|   |-- screens/        # UI screens
|   |-- services/       # Services for handling data, APIs, etc.
|   |-- utils/          # Utility functions and constants
|   |-- widgets/        # Reusable UI widgets
|-- test/               # Automated tests
|-- assets/             # Static assets (images)
|-- screenshots/        # Screenshots for README or documentation
|-- pubspec.yaml        # Flutter project configuration file
|-- README.md           # Project documentation
|-- LICENSE             # Project license
```

## Installation

### Prerequisites

Ensure you have Flutter installed on your machine. You can download it from [here](https://flutter.dev/docs/get-started/install).

### Steps

1. Clone the repository:
    ```sh
    git clone https://github.com/Usukhbayar04/todo_list_app.git
    ```
2. Navigate to the project directory:
    ```sh
    cd todo_list_app
    ```
3. Install the dependencies:
    ```sh
    flutter pub get
    ```
4. Run the app:
    ```sh
    flutter run
    ```

## Screenshots

Add screenshots here to give users a visual of your app.

## Contributing

1. Fork the repository.
2. Create your feature branch:
    ```sh
    git checkout -b feature/your-feature-name
    ```
3. Commit your changes:
    ```sh
    git commit -m 'Add some feature'
    ```
4. Push to the branch:
    ```sh
    git push origin feature/your-feature-name
    ```
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter documentation
- GetX package documentation
- Dio package documentation
