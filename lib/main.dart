import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/add_page.dart';
import 'package:to_do_app/list_controller.dart';
import 'package:get/get.dart';
import 'package:to_do_app/routs.dart';

import 'main.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.put(ListController());
    return MaterialApp(
      initialRoute: "/",
      routes: {
        // "/": (context) => MainApp(),
        MyRoutes.home: (context) => MainApp(),
        MyRoutes.add: (context) => AddPage()
      },
      debugShowCheckedModeBanner: false,
      home: ContentPage(controller: controller),
    );
  }
}

class ContentPage extends StatefulWidget {
  const ContentPage({
    super.key,
    required this.controller,
  });

  final ListController controller;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  bool value = false;
  List<bool> checks = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "To do app",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            CupertinoIcons.add,
          ),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.add);
          },
        ),
        body: Container(
          child: widget.controller.temp.isEmpty
              ? Center(
                  child: Container(
                    child: Text(
                      "No tasks to do now..! Click on add button to add the tasks",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: widget.controller.temp.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(widget.controller.temp[index]),
                        trailing: InkWell(
                            onTap: () {
                              widget.controller.temp.removeAt(index);
                              setState(() {});
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                            )),
                      )),
        ),
      ),
    );
  }
}
