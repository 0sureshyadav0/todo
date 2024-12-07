import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_list_provider.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(1),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("./assets/images/background.jpeg"),
          ),
          borderRadius: BorderRadius.circular(10.0)),
      height: deviceHeight / 1.9,
      width: deviceWidth,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: deviceHeight / 2.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _titleController,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                            focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            )),
                            border: OutlineInputBorder(),
                            floatingLabelStyle: TextStyle(color: Colors.red),
                            hintText: "Title",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _descController,
                        cursorColor: Colors.white,
                        maxLines: 6,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            )),
                            border: OutlineInputBorder(),
                            floatingLabelStyle: TextStyle(color: Colors.red),
                            hintText: "Description",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Provider.of<TodoListProvider>(context, listen: false)
                              .addTodo(_titleController.text,
                                  _descController.text, false);
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: deviceWidth,
                          height: deviceHeight / 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: const Border(
                              left: BorderSide(
                                color: Colors.red,
                              ),
                              right: BorderSide(
                                color: Colors.red,
                              ),
                              top: BorderSide(
                                color: Colors.red,
                              ),
                              bottom: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: const Center(
                            child: Text(
                              "A D D",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
