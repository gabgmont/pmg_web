import 'package:flutter/material.dart';
import 'package:pmg_project/screens/user/controller/search_controller.dart';

import '../../model/policy_item_model.dart';
import '../../model/policy_status_model.dart';
import '../../utils/app_colors.dart';
import 'widgets/policy_filter_widget.dart';
import 'widgets/policy_item_widget.dart';
import 'widgets/policy_list_widget.dart';
import 'widgets/user_page_header_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final searchController = SearchController();
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final policies = [
      PolicyItemWidget(
        status: PolicyStatusModel.approved(),
        policyModel: PolicyItemModel(
            'N°9999', 'Cleber de tal', 'Porto Seguro', '10/10/22'),

      ),
      PolicyItemWidget(
        status: PolicyStatusModel.pending(),
        policyModel: PolicyItemModel(
            'N°9998', 'Jose de tal', 'Porto Seguro', '10/10/22'),

      ),
      PolicyItemWidget(
        status: PolicyStatusModel.refused(),
        policyModel:
            PolicyItemModel('N°9997', 'Cleber de tal', 'Tokio', '10/10/21'),

      ),
      PolicyItemWidget(
        status: PolicyStatusModel.canceled(),
        policyModel:
            PolicyItemModel('N°9996', 'Joao de tal', 'Pottencial', '10/10/21'),

      )
    ];

    if (!searchController.initialized) {
      searchController.init(policies);
    }

    return Material(
      color: AppColors.lightGray,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const HeaderWidget(),
            Row(
              children: [
                PolicyFilterWidget(
                  searchController: searchController,
                  onTap: () {
                    setState(() {});
                  },
                ),
                PolicyListWidget(
                  onChange: (_) {
                    setState(() {});
                  },
                  searchController: searchTextController,
                  policies:
                      searchController.executeFilter(searchTextController.text),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
