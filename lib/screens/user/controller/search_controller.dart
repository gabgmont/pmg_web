import '../widgets/policy_item_widget.dart';

class SearchController {
  late List<PolicyItemWidget> policies;

  init(List<PolicyItemWidget> newPolicies) {
    policies = newPolicies;
  }

  List<PolicyItemWidget> executeFilter(String filter) {
    if(filter.isEmpty) return policies;

    return policies.where((element) =>
      element.policyModel.policyNumber.toLowerCase().contains(filter.toLowerCase()) ||
          element.status.label.toLowerCase().contains(filter.toLowerCase()) ||
          element.policyModel.policyAssurace.toLowerCase().contains(filter.toLowerCase()) ||
          element.policyModel.policyName.toLowerCase().contains(filter.toLowerCase())
    ).toList();
  }
}
