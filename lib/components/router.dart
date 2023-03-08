import 'package:flutter/material.dart';
import 'package:joints_camp/components/add_todo.dart';
import 'package:joints_camp/pages/todo_page.dart';
import '../pages/home.dart';

const String homeRoute = '/';
const String todoRoute = '/todo';
const String addTodoRoute = '/add_todo';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case todoRoute:
        return MaterialPageRoute(builder: (_) => const Todo());
      case addTodoRoute:
        return MaterialPageRoute(builder: (_) => const AddTodo());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
