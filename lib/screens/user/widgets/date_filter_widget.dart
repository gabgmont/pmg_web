import 'package:flutter/material.dart';

import 'date_form_field.dart';

const _dropDownWidth = 190.0;

class DateFilterWidget extends StatefulWidget {

  const DateFilterWidget({Key? key}) : super(key: key);

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 80,
      width: _dropDownWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DateFormField(
            label: 'De',
            date: '10/10/2022',
            controller: startDateController,
          ),
          const SizedBox(height: 4,),
          DateFormField(
            label: 'Até',
            date: '10/12/2022',
            controller: endDateController,
          ),
        ],
      ),
    );
  }
}
