import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color_constants.dart';

class RequestPageController extends GetxController {
  RxList<String> selectedCategory = <String>[].obs;
  RxBool isCheckboxSelected = false.obs;
  Rx<DateTime?> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay?> selectedTime = TimeOfDay.now().obs;

  setCategoryIndex(String i) {
    if (isCheckboxSelected.value) return;
    if (selectedCategory.contains(i)) {
      selectedCategory.remove(i);
    } else {
      selectedCategory.add(i);
    }
  }

  setCheckbox(bool value) {
    isCheckboxSelected.value = value;
    if (isCheckboxSelected.value) {
      selectedCategory.clear();
    }
  }

  selectDate(BuildContext context) async {
    selectedDate.value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
  }

  selectTime(BuildContext context) async {
    selectedTime.value =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  Color bgColor(text) => selectedCategory.contains(text)
      ? primaryColor
      : const Color(0xff0D1321).withOpacity(0.05);
  Color fontColor(text) => selectedCategory.contains(text)
      ? Colors.white
      : const Color(0xFF0D1321).withOpacity(0.6);
  Color borderColor(text) =>
      selectedCategory.contains(text) ? Colors.white : primaryColor;
}
