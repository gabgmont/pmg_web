import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PolicyStatusModel{
  final IconData icon;
  final Color color;
  final String status;

  PolicyStatusModel.approved() :
      icon = Icons.check_circle,
      color = AppColors.approved,
      status = 'Aprovado';

  PolicyStatusModel.refused() :
        icon = Icons.cancel,
        color = AppColors.refused,
        status = 'Recusado';

  PolicyStatusModel.pending() :
        icon = Icons.pending,
        color = AppColors.pending,
        status = 'Em análise';

  PolicyStatusModel.canceled() :
        icon = Icons.block,
        color = AppColors.canceled,
        status = 'Cancelado';
}
