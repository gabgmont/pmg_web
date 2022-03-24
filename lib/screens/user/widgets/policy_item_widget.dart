import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmg_project/model/policy_status_model.dart';

import '../../../model/policy_item_model.dart';
import '../../../utils/app_colors.dart';

const _policyItemHeight = 130.0;
const _borderRadius = 17.0;

class PolicyItemWidget extends StatefulWidget {
  final PolicyStatusModel status;
  final PolicyItemModel policyModel;

  const PolicyItemWidget({
    Key? key,
    required this.status,
    required this.policyModel,
  }) : super(key: key);

  @override
  State<PolicyItemWidget> createState() => _PolicyItemWidgetState();
}

class _PolicyItemWidgetState extends State<PolicyItemWidget>
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
  void didUpdateWidget(PolicyItemWidget oldWidget) {
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
    final policyItemStyle = GoogleFonts.reemKufi(fontSize: 18);

    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: _policyItemHeight,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(_borderRadius),
                boxShadow: [
                  BoxShadow(
                      offset: Offset.fromDirection(1, 1),
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 1)
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(_borderRadius),
                    elevation: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          open = !open;
                          _runExpandCheck();
                        });
                      },
                      child: SizedBox(
                        height: _policyItemHeight,
                        child: Row(
                          children: [
                            SizedBox(
                              width: _policyItemHeight,
                              child: Icon(
                                widget.status.icon,
                                size: 80,
                                color: widget.status.color,
                              ),
                            ),
                            Container(
                              height: _policyItemHeight - 20,
                              width: 1,
                              color: AppColors.lightGray,
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.policyModel.policyNumber,
                                      style: policyItemStyle,
                                    ),
                                    Text(
                                      widget.policyModel.policyName,
                                      style: policyItemStyle,
                                    ),
                                    Text(
                                      widget.policyModel.policyAssurace,
                                      style: policyItemStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.policyModel.date,
                                      style: policyItemStyle,
                                    ),
                                    Text(
                                      widget.status.label,
                                      style: GoogleFonts.reemKufi(
                                          color: widget.status.color),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(
                    Icons.more_horiz,
                    color: AppColors.white,
                    size: 60,
                  ),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.0),
          child: SizeTransition(
            sizeFactor: _controller,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(_borderRadius),
                      bottomRight: Radius.circular(_borderRadius))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                widget.policyModel.address,
                                style: GoogleFonts.reemKufi(),
                              ),
                            ),
                            Text(
                              widget.policyModel.tenantLabel,
                              style: GoogleFonts.reemKufi(
                                  fontWeight: FontWeight.bold),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widget.policyModel.tenantList
                                  .map((name) => SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4.0),
                                              child: Container(
                                                height: 12,
                                                width: 1,
                                                color: AppColors.lightGray,
                                              ),
                                            ),
                                            Text(
                                              name,
                                              style: GoogleFonts.reemKufi(),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                widget.policyModel.validity,
                                style: GoogleFonts.reemKufi(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            DetailsItem(
                              label: 'LMG',
                              value: '26.000,00',
                            ),
                            DetailsItem(
                              label: 'Prêmio Total',
                              value: '100,00',
                            ),
                            DetailsItem(
                              label: 'Comissão',
                              value: '30,00',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: (widget.policyModel.tenantList.length * 20) + 65,
                        width: 1,
                        color: AppColors.lightGray,
                      ),
                    ),
                    DetailsStatus(
                      assuranceType: widget.policyModel.assuranceType,
                      assuranceStatus: widget.policyModel.assuranceStatus,
                      color: widget.status.color,
                      icon: widget.status.icon,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DetailsItem extends StatelessWidget {
  final String label;
  final String value;

  const DetailsItem({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            height: 30,
            width: 1,
            color: AppColors.lightGray,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.reemKufi(fontWeight: FontWeight.bold)
            ),
            Text(
              'R\$$value',
              style: GoogleFonts.reemKufi()
            )
          ],
        )
      ],
    );
  }
}

class DetailsStatus extends StatelessWidget {
  final String assuranceType;
  final String assuranceStatus;
  final IconData icon;
  final Color color;

  const DetailsStatus(
      {Key? key,
      required this.assuranceType,
      required this.assuranceStatus,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              assuranceType,
              style: GoogleFonts.reemKufi(
                  fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Icon(
              icon,
              color: color,
              size: 44,
            ),
            Text(
              assuranceStatus,
              style: GoogleFonts.reemKufi(),
            )
          ],
        ),
      ),
    );
  }
}
