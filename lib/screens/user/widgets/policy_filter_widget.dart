import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/model/policy_status_model.dart';
import 'package:pmg_project/screens/user/controller/search_controller.dart';
import 'package:pmg_project/utils/app_colors.dart';

import 'date_form_field.dart';
import 'filter_drop_down_widget.dart';
import 'filter_item_widget.dart';

class PolicyFilterWidget extends StatefulWidget {
  final SearchController searchController;
  final VoidCallback onTap;

  const PolicyFilterWidget({Key? key, required this.searchController,required this.onTap})
      : super(key: key);

  @override
  State<PolicyFilterWidget> createState() => _PolicyFilterWidgetState();
}

class _PolicyFilterWidgetState extends State<PolicyFilterWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final startDateController = TextEditingController();
    final endDateController = TextEditingController();

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
                          onTap: (label) {
                            setState(() {
                              widget.onTap();
                              widget.searchController.updateStatusFilter(label);
                            });
                          },
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.pending(),
                          onTap: (label) {
                            setState(() {
                              widget.onTap();
                              widget.searchController.updateStatusFilter(label);
                            });
                          },
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.refused(),
                          onTap: (label) {
                            setState(() {
                              widget.onTap();
                              widget.searchController.updateStatusFilter(label);
                            });
                          },
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.canceled(),
                          onTap: (label) {
                            setState(() {
                              widget.onTap();
                              widget.searchController.updateStatusFilter(label);
                            });
                          },
                        ),
                      ],
                    ),
                    FilterDropDownWidget(
                      label: 'Seguradora',
                      itens: [
                        FilterItemWidget(
                          status: PolicyStatusModel.assureance('Porto Seguro'),
                          onTap: (label) {
                            setState(() {
                              widget.onTap();
                              widget.searchController.updateAssuranceFilter(label);
                            });
                          },
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.assureance('Pottencial'),
                          onTap: (label) {
                            setState(() {
                              widget.onTap();
                              widget.searchController.updateAssuranceFilter(label);
                            });
                          },
                        ),
                        FilterItemWidget(
                          status: PolicyStatusModel.assureance('Tokio'),
                          onTap: (label) {
                            setState(() {
                              widget.onTap();
                              widget.searchController.updateAssuranceFilter(label);
                            });
                          },
                        ),
                      ],
                    ),
                    FilterDropDownWidget(
                      label: 'Data',
                      itens: [
                        DateFormField(
                          label: 'De',
                          date: '10/12/2022',
                          controller: startDateController,
                        ),
                        DateFormField(
                          label: 'Até',
                          date: '10/12/2022',
                          controller: endDateController,
                        ),
                      ],
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
