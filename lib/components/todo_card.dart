import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  String title;
  String date;

  TodoCard({super.key, required this.title, required this.date});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isChecked = false;

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
          Checkbox(
            value: isChecked,
            onChanged: (val) {
              setState(() {
                isChecked = val!;
              });
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title.toString(), //title
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(widget.date.toString()), //tanggal
            ],
          ),
          const Expanded(child: SizedBox()),
          const Icon(Icons.star_border)
        ],
      ),
    );
  }
}
