import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/model/policy_status_model.dart';
import 'package:pmg_project/utils/app_colors.dart';

import 'date_filter_widget.dart';
import 'filter_drop_down_widget.dart';
import 'filter_item_widget.dart';

class PolicyFilterWidget extends StatelessWidget {
  const PolicyFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 60,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.filter_alt_rounded,
                size: 40,
                color: AppColors.primary,
              ),
              Text(
                'Filtrar',
                style: GoogleFonts.reemKufi(
                    fontSize: 28, color: AppColors.primary),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    FilterDropDownWidget(
                      label: 'Status',
                      itens: [
                        FilterItemWidget(
                          status: PolicyStatusModel.approved(),
                          onTap: () {

                          },
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.pending(),
                          onTap: () {},
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.refused(),
                          onTap: () {},
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.canceled(),
                          onTap: () {},
                        ),
                      ],
                    ),
                    FilterDropDownWidget(
                      label: 'Seguradora',
                      itens: [
                        FilterItemWidget(
                          status: PolicyStatusModel.assureance('Porto Seguro'),
                          onTap: () {},
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.assureance('Pottencial'),
                          onTap: () {},
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.assureance('Tokio'),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const FilterDropDownWidget(
                      label: 'Data',
                      itens: [DateFilterWidget()],
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  color: AppColors.primary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
