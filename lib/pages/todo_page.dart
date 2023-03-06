import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joints_camp/components/todo_card.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "JOINTS Todo",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            TodoCard(title: "Tes", date: "25-Maret-2023"),
            TodoCard(title: "Wkwkwkwk", date: "25-Maret-2023"),
            TodoCard(title: "Poyokz", date: "25-Maret-2023"),
            TodoCard(title: "Flutter", date: "25-Maret-2023"),
            TodoCard(title: "Kotlin", date: "25-Maret-2023"),
            TodoCard(title: "Python", date: "25-Maret-2023"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
