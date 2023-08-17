import 'package:get/get.dart';

class ListController extends GetxController {
  List temp = [].obs;
  List<bool> checks = [];
  void add(String s) {
    checks.add(false);
    temp.add(s);
  }

  void remove(String s) {
    temp.remove(s);
  }
}
