import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_list_provider.dart';
// import 'package:todo/components/bottom_sheet.dart';

class TodoDescription extends StatefulWidget {
  final int index;
  const TodoDescription({super.key, required this.index});

  @override
  State<TodoDescription> createState() => _TodoDescriptionState();
}

class _TodoDescriptionState extends State<TodoDescription> {
  List<Map<String, dynamic>>? getTodoList;
  int? todoLength;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.red,

      body: Stack(
        children: [
          Image.asset(
            "./assets/images/background.jpeg",
            height: deviceHeight,
            fit: BoxFit.fill,
            width: deviceWidth,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBar(
                        leading: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        shadowColor: Colors.black,
                        elevation: 5,
                        shape: const Border(
                          top: BorderSide(color: Colors.red),
                          bottom: BorderSide(color: Colors.red),
                          left: BorderSide(color: Colors.pink),
                          right: BorderSide(color: Colors.red),
                        ),
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        title: const Text(
                          "T O D O",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        centerTitle: true,
                      ),
                      const SizedBox(height: 30),
                      Consumer<TodoListProvider>(builder: (BuildContext context,
                          TodoListProvider todoListProvider, Widget? child) {
                        print(
                            "List length: ${todoListProvider.getTodoList.length}");
                        print("Widget index: ${widget.index}");
                        if (widget.index > todoListProvider.todoCount - 1) {
                          print("Error: widget.index is greater ");
                        }
                        return Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10.0)),
                            width: deviceWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${todoListProvider.getTodoList[widget.index]['title']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 30.0)),
                                Text(
                                    "${todoListProvider.getTodoList[widget.index]['desc']}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20.0)),
                              ],
                            ));
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
