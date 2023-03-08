import 'package:flutter/material.dart';
import '../model/todo_model.dart';

class TodoCard extends StatefulWidget {
  final TodoModel model;

  const TodoCard({super.key, required this.model});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isChecked = false;
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(3, 3),
            blurRadius: 5),
      ]),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val!;
                });
              },
              shape: const CircleBorder(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.title.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(widget.model.date.toString()),
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.blue : null,
              size: 30,
            ),
            onPressed: toggleFavorite,
          )
        ],
      ),
    );
  }
}
