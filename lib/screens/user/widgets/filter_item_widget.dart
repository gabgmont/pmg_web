import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/model/policy_status_model.dart';

import '../../../utils/app_colors.dart';

class FilterItemWidget extends StatefulWidget {
  final PolicyStatusModel status;
  final VoidCallback onTap;

  const FilterItemWidget({Key? key, required this.status, required this.onTap})
      : super(key: key);

  @override
  State<FilterItemWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends State<FilterItemWidget> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: pressed ? AppColors.hoverPrimary : Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            pressed = !pressed;
            widget.onTap();
          });
        },
        hoverColor: AppColors.hoverPrimary,
        child: SizedBox(
          height: 30,
          child: Row(
            children: [
              Icon(
                widget.status.icon,
                color: widget.status.color,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  widget.status.label,
                  style: GoogleFonts.reemKufi(color: AppColors.primary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
