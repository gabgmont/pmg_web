import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/model/policy_status_model.dart';

import '../../../utils/app_colors.dart';

class FilterItemWidget extends StatelessWidget {
  final PolicyStatusModel status;
  const FilterItemWidget({Key? key,required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Icon(status.icon, color: status.color,),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(status.label, style: GoogleFonts.reemKufi(color: AppColors.primary),),
          )
        ],
      ),
    );
  }
}
