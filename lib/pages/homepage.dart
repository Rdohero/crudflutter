import 'package:crudflutter/todo_controller.dart';
import 'package:crudflutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());

    return Scaffold(
      backgroundColor: const Color(0xFFD5F0C1),
      appBar: AppBar(
        title: const Text("Note",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF80BCBD),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: todoController.title,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFF9F7C9),
                    filled: true,
                    hintText: 'Enter your Title...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.secondColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.secondColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: todoController.description,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFF9F7C9),
                    filled: true,
                    hintText: 'Enter your Description...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.secondColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.secondColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              todoController.addTodo();
            },
            child: Container(
              height: 45,
              width: double.infinity,
              margin: const EdgeInsets.only(right: 10,left: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFAAD9BB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("ALL NOTES",style: TextStyle(fontWeight: FontWeight.bold),)],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(
                  () => ListView(
                children: todoController.todoList
                    .map((e) => Dismissible(
                      onDismissed: (direction) async {
                        todoController.deleteTodo(e.id!);
                      },
                      background: deleteBgItem()  ,
                      key: Key(e.id!),
                      child: ListTile(
                        tileColor: const Color(0xFFF9F7C9),
                        onTap: () {},
                        title: Text(e.title!),
                        subtitle: Text(e.description!),
                        trailing: InkWell(
                          onTap: () {
                            todoController.updatedTitle.text =
                            e.title!;
                            todoController.updatedDescription.text =
                            e.description!;
                            Get.defaultDialog(
                              backgroundColor:
                              const Color(0xFFD5F0C1),
                              title: "Update Note",
                              titleStyle: const TextStyle(
                                  color: Colors.black),
                              content: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      style: const TextStyle(
                                          color:
                                          Colors.black),
                                      controller: todoController
                                          .updatedTitle,
                                      decoration: InputDecoration(
                                        fillColor:
                                        const Color(0xFFAAD9BB),
                                        filled: true,
                                        hintText:
                                        'Enter updated Title...',
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10.0),
                                          borderSide:
                                          const BorderSide(
                                            color: Colors.purple,
                                          ),
                                        ),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10.0),
                                          borderSide:
                                          const BorderSide(
                                            color: AppColors
                                                .secondColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(
                                          color:
                                          Colors.black),
                                      controller: todoController
                                          .updatedDescription,
                                      decoration: InputDecoration(
                                        fillColor:
                                        const Color(0xFFAAD9BB),
                                        filled: true,
                                        hintText:
                                        'Enter updated Description...',
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10.0),
                                          borderSide:
                                          const BorderSide(
                                            color: Colors.purple,
                                          ),
                                        ),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10.0),
                                          borderSide:
                                          const BorderSide(
                                            color: AppColors
                                                .secondColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (todoController
                                            .updatedTitle
                                            .text
                                            .isEmpty) {
                                          Get.snackbar(
                                            "Error",
                                            "Title and description cannot be empty",
                                            snackPosition:
                                            SnackPosition
                                                .BOTTOM,
                                            backgroundColor:
                                            AppColors
                                                .warningColor,
                                            colorText:
                                            AppColors.textColor,
                                            duration:
                                            const Duration(
                                                milliseconds:
                                                1500),
                                          );
                                        } else {
                                          todoController
                                              .updateTodo(e);
                                          Get.back();
                                        }
                                      },
                                      child: Container(
                                        height: 45,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color:
                                          AppColors.secondColor,
                                          borderRadius:
                                          BorderRadius.circular(
                                              10),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.done,
                                            color:
                                            AppColors.textColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF80BCBD),
                              borderRadius:
                              BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: AppColors.textColor,
                            ),
                          ),
                        )
                      ),
                    ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget deleteBgItem() {
  return Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    color: Colors.red,
    child: const Icon(Icons.delete, color: Colors.white,),
  );
}