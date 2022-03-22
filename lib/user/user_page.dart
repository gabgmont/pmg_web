import 'package:flutter/material.dart';
import 'package:pmg_project/Utils/app_colors.dart';
import 'package:pmg_project/user/widgets/user_page_header_widget.dart';

import 'widgets/policy_filter_widget.dart';
import 'widgets/policy_list_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Material(
      color: AppColors.lightGray,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            HeaderWidget(),
            Row(
              children: [
                PolicyFilterWidget(),
                PolicyListWidget()
              ],
            )
          ],
        ),
      ),
    );
  }
}
