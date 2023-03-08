import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:joints_camp/model/todo_model.dart';
import 'package:joints_camp/components/appbar.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            _isFormValid = _formKey.currentState!.validate();
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: _title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add task",
                  prefixIcon: Icon(Icons.circle_outlined),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
                controller: _date,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter date",
                  prefixIcon: Icon(Icons.calendar_today_rounded),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));

                  if (pickedDate != null) {
                    setState(() {
                      _date.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                    });
                  }
                },
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: _isFormValid
                    ? () {
                        final newTodo =
                            TodoModel(title: _title.text, date: _date.text);
                        Navigator.of(context).pop(newTodo);
                      }
                    : null,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _isFormValid ? Colors.blue : Colors.grey),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
