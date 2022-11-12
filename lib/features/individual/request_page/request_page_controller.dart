import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:trashfree/common/widgets/custom_snackbar.dart';
import 'package:trashfree/constants/api_constants.dart';
import '../../../constants/color_constants.dart';

class RequestPageController extends GetxController {
  RxList<String> selectedCategory = <String>[].obs;
  RxBool isCheckboxSelected = false.obs;
  Rx<DateTime?> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay?> selectedTime = TimeOfDay.now().obs;
  final TextEditingController locationTextController = TextEditingController();

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

  void postRequest() async {
    final wasteType =
        isCheckboxSelected.value ? ['I dont know'] : selectedCategory;
    final response = await http.post(Uri.parse(Api.postRequest),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'date': selectedDate.value.toString(),
          'pickup_time': selectedTime.value.toString(),
          'waste_type': wasteType,
          'location': locationTextController.text,
        }));
    var jsonResponse = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        clear();
        CustomSnackBars.showSuccessSnackBar(
            Get.context!, 'Successfully posted your request');
      } else {
        CustomSnackBars.showErrorSnackBar(
            'Request failed', jsonResponse['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBars.showErrorSnackBar(
          'Request failed', 'Something went wrong');
    }
  }

  void clear() {
    selectedCategory.clear();
    isCheckboxSelected.value = false;
    selectedDate.value = DateTime.now();
    selectedTime.value = TimeOfDay.now();
    locationTextController.clear();
  }
}
