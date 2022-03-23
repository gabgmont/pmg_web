import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/model/policy_status_model.dart';

import '../../../model/policy_item_model.dart';
import '../../../utils/app_colors.dart';


class PolicyItemWidget extends StatelessWidget {
  final PolicyStatusModel status;
  final PolicyItemModel policyModel;

  const PolicyItemWidget(
      {Key? key, required this.status, required this.policyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final policyItemStyle = GoogleFonts.reemKufi(fontSize: 18);

    return Stack(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                  offset: Offset.fromDirection(1, 1),
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Icon(
                        status.icon,
                        size: 65,
                        color: status.color,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 1,
                      color: AppColors.lightGray,
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              policyModel.policyNumber,
                              style: policyItemStyle,
                            ),
                            Text(
                              policyModel.policyName,
                              style: policyItemStyle,
                            ),
                            Text(
                              policyModel.policyAssurace,
                              style: policyItemStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(policyModel.date, style: policyItemStyle,),
                            Text(
                              status.status,
                              style: GoogleFonts.reemKufi(color: status.color),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.more_horiz,
                color: AppColors.white,
                size: 48,
              ),
            )
          ],
        ),
      ],
    );
  }
}
