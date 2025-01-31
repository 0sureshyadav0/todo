import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/bottom_sheet.dart';
import 'package:todo/providers/todo_list_provider.dart';
import 'package:todo/screens/todo_description.dart';
// import 'package:todo/components/bottom_sheet.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>>? getTodoList;
  @override
  void initState() {
    super.initState();
    Provider.of<TodoListProvider>(context, listen: false).loadTodo();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.red,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
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
                        shadowColor: Colors.black,
                        elevation: 5,
                        shape: const Border(
                          top: BorderSide(color: Colors.red),
                          bottom: BorderSide(color: Colors.red),
                          left: BorderSide(color: Colors.red),
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
                        return SizedBox(
                          height: deviceHeight / 1.35,
                          child: ListView.builder(
                              itemCount: todoListProvider.todoCount,
                              itemBuilder: (context, index) {
                                final bool isDone = todoListProvider
                                    .getTodoList[index]['isDone'];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        border: Border(
                                          left: BorderSide(
                                            color: isDone
                                                ? Colors.green
                                                : Colors.red,
                                            width: 15.0,
                                          ),
                                          right: BorderSide(
                                            color: isDone
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                          top: BorderSide(
                                            color: isDone
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                          bottom: BorderSide(
                                            color: isDone
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    height: deviceHeight / 12,
                                    child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TodoDescription(
                                                          index: index)));
                                        },
                                        title: Text(
                                          "${todoListProvider.getTodoList[index]['title']}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "${todoListProvider.getTodoList[index]['time'] ?? 'Time is not set'}",
                                          style: TextStyle(
                                            color: todoListProvider
                                                            .getTodoList[index]
                                                        ['time'] ==
                                                    null
                                                ? const Color.fromARGB(
                                                    255, 204, 203, 203)
                                                : const Color.fromARGB(
                                                    255, 3, 221, 10),
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CheckboxTheme(
                                              data: const CheckboxThemeData(
                                                  side: BorderSide(
                                                      width: 2,
                                                      color: Colors.red)),
                                              child: Checkbox(
                                                  activeColor: Colors.green,
                                                  focusColor: Colors.green,
                                                  checkColor: Colors.white,
                                                  value: todoListProvider
                                                          .getTodoList[index]
                                                      ['isDone'],
                                                  onChanged: (value) {
                                                    todoListProvider
                                                        .isTaskCompleted(
                                                            index, value);
                                                  }),
                                            ),
                                            const SizedBox(width: 20),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: (context),
                                                    builder: (context) {
                                                      return Dialog(
                                                        backgroundColor: Colors
                                                            .grey
                                                            .withOpacity(0.3),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                            border:
                                                                const Border(
                                                              left: BorderSide(
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              right: BorderSide(
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              top: BorderSide(
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              bottom:
                                                                  BorderSide(
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                          ),
                                                          height: 150,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        14.0,
                                                                    vertical:
                                                                        20.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                const Text(
                                                                    "Are you sure want to delete the task ?",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20.0,
                                                                    )),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Text(
                                                                            "Cancel",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.green,
                                                                            ))),
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          todoListProvider
                                                                              .removeTodo(index);
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Text(
                                                                            "Yes",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.red,
                                                                            )))
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              icon: const FaIcon(
                                                size: 20,
                                                FontAwesomeIcons.trash,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                );
                              }),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const CustomBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
