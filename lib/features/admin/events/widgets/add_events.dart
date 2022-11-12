import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trashfree/common/widgets/custom_button.dart';
import 'package:trashfree/common/widgets/custom_text_field.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/features/admin/events/event_controller.dart';

import '../../../individual/request_page/request_page.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final EventController controller = Get.find<EventController>();
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(top: deviceHeight * 0.01),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Column(
          children: [
            const TextTitle(text: 'Add Event', fontSize: 22),
            SizedBox(height: deviceHeight * 0.03),
            CustomTextField(
              labelText: 'Event Title',
              prefixIcon: Icons.title,
              controller: controller.titleController,
            ),
            CustomTextField(
              labelText: 'Location',
              prefixIcon: Icons.location_on,
              controller: controller.locationController,
            ),
            SizedBox(height: deviceHeight * 0.03),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RowInfo(
                      title: 'Date: ',
                      value: DateFormat('MMM dd, yyyy')
                          .format(controller.selectedDate.value!),
                      onTap: () => controller.selectDate(context),
                    ),
                    SizedBox(width: deviceWidth * .06),
                    Obx(
                      () => RowInfo(
                        title: 'Pickup time: ',
                        value: controller.selectedTime.value!.format(context),
                        onTap: () => controller.selectTime(context),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: deviceHeight * 0.03),
            CustomButton(
                text: 'Submit', onPressed: () => controller.createEvent()),
            SizedBox(height: deviceHeight * 0.05),
          ],
        )),
      ),
    );
  }
}
