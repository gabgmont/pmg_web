import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import 'policy_item_widget.dart';
import 'search_bar_widget.dart';

class PolicyListWidget extends StatelessWidget {
  final List<PolicyItemWidget> policies;
  const PolicyListWidget({Key? key,required this.policies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final searchController = TextEditingController();

    return SizedBox(
      height: size.height - 60,
      width: size.width - 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'Suas Apólices',
              style:
                  GoogleFonts.reemKufi(color: AppColors.primary, fontSize: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchBarWidget(
              hint: 'Nome, Número',
              textController: searchController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: SizedBox(
              height: size.height- 153,
              child: ListView.builder(
                primary: false,
                controller: ScrollController(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: policies.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: policies[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
