import 'package:flutter/material.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/color_constants.dart';
import 'package:trashfree/constants/dimensions.dart';

class RequestHistory extends StatelessWidget {
  const RequestHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextTitle(
                  text: 'Request History',
                  fontSize: 20,
                ),
                SizedBox(height: deviceHeight * 0.03),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          tileColor: secondaryColor,
                          title: TextTitle(
                            text: 'Request ID No $index',
                            fontSize: 17,
                            textAlign: TextAlign.left,
                          ),
                          subtitle: Text('Request ID No $index'),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                            onPressed: () {},
                          )),
                      SizedBox(height: deviceHeight * 0.012)
                    ],
                  ),
                  itemCount: 10,
                  shrinkWrap: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
