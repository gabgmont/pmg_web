import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PolicyStatusModel{
  final IconData icon;
  final Color color;
  final String label;

  PolicyStatusModel.approved() :
      icon = Icons.check_circle,
      color = AppColors.approved,
      label = 'Aprovado';

  PolicyStatusModel.refused() :
        icon = Icons.cancel,
        color = AppColors.refused,
        label = 'Recusado';

  PolicyStatusModel.pending() :
        icon = Icons.pending,
        color = AppColors.pending,
        label = 'Em análise';

  PolicyStatusModel.canceled() :
        icon = Icons.block,
        color = AppColors.canceled,
        label = 'Cancelado';

  PolicyStatusModel.assureance(String name) :
        icon = Icons.account_balance_outlined,
        color = AppColors.primary,
        label = name;
}
