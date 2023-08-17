import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/list_controller.dart';
import 'package:to_do_app/routs.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  ListController controller = Get.put(ListController());
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;
  showError(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      controller.temp.add(nameController.text);
      Navigator.pushNamed(context, MyRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: ElevatedButton(
          onPressed: () => showError(context),
          child: Text("Done"),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 16, bottom: 16, left: 3, right: 3),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field cannot be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
