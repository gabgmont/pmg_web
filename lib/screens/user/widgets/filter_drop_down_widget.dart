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

class _FilterDropDownWidgetState extends State<FilterDropDownWidget>
    with SingleTickerProviderStateMixin {
  bool open = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    super.initState();
  }

  void _runExpandCheck() {
    if (open) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(FilterDropDownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          hoverColor: AppColors.hoverPrimary,
          onTap: () {
            setState(() {
              open = !open;
              _runExpandCheck();
            });
          },
          child: SizedBox(
            height: 30,
            width: _dropDownWidth,
            child: Row(
              children: [
                AnimatedIcon(
                  icon: AnimatedIcons.menu_arrow,
                  progress: _controller,
                  size: 24,
                  color: AppColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    widget.label,
                    style: GoogleFonts.reemKufi(
                        fontSize: 18, color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _controller,
          child: SizedBox(
            width: _dropDownWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.itens,
            ),
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
