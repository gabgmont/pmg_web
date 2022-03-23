import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/utils/app_colors.dart';

const _dropDownWidth = 190.0;

class FilterDropDownWidget extends StatefulWidget {
  final String label;
  final List<Widget> itens;

  const FilterDropDownWidget({
    Key? key,
    required this.label,
    required this.itens,
  }) : super(key: key);

  @override
  State<FilterDropDownWidget> createState() => _FilterDropDownWidgetState();
}

class _FilterDropDownWidgetState extends State<FilterDropDownWidget> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          hoverColor: AppColors.hoverPrimary,
          onTap: (){
            setState(() {
              open = !open;
            });
          },
          child: SizedBox(
            height: 30,
            width: _dropDownWidth,
            child: Row(
              children: [
                Icon(
                  open
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  size: 32,
                  color: AppColors.primary,
                ),
                Text(
                  widget.label,
                  style: GoogleFonts.reemKufi(
                      fontSize: 18, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: _dropDownWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: open ? widget.itens : [],
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
