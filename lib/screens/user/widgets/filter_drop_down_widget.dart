import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/utils/app_colors.dart';

const _dropDownWidth = 190.0;

class FilterDropDownWidget extends StatelessWidget {
  final String label;
  final bool open;
  final List<Widget> itens;

  const FilterDropDownWidget(
      {Key? key, required this.label, required this.itens, this.open = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          width: _dropDownWidth,
          child: Row(
            children: [
              const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 32,
                color: AppColors.primary,
              ),
              Text(
                label,
                style: GoogleFonts.reemKufi(
                    fontSize: 18, color: AppColors.primary),
              ),
            ],
          ),
        ),
        SizedBox(
          width: _dropDownWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: open ? itens : [],
          ),
        ),
        Container(
          width: _dropDownWidth - 16,
          height: 1,
          color: AppColors.primary,
        )
      ],
    );
  }
}
