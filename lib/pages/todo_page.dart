import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joints_camp/components/router.dart';
import 'package:joints_camp/components/todo_card.dart';
import 'package:joints_camp/components/appbar.dart';
import '../model/todo_model.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final List<TodoModel> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: _todos.map((e) => TodoCard(model: e)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await Navigator.pushNamed(context, addTodoRoute) as TodoModel?;
          if (result != null) {
            setState(() {
              _todos.add(result);
            });
          }
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
