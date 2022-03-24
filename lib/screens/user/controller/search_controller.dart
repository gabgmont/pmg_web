import '../widgets/policy_item_widget.dart';

class SearchController {
  bool initialized = false;
  late List<PolicyItemWidget> policies;
  late List<PolicyItemWidget> filteredPolicies;
  List<String> statusFilters = [];
  List<String> assuranceFilters = [];

  init(List<PolicyItemWidget> newPolicies) {
    policies = newPolicies;
    filteredPolicies = newPolicies;
    initialized = true;
  }

  List<PolicyItemWidget> executeFilter(String filter) {
    if (filter.isEmpty && statusFilters.isEmpty && assuranceFilters.isEmpty) return policies;
    var auxPolicies = <PolicyItemWidget>[];

    if (statusFilters.isNotEmpty && assuranceFilters.isEmpty) {
      for (var value in statusFilters) {
        auxPolicies.addAll(policies
            .where((element) => element.status.label
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList());
      }
      return auxPolicies;
    }

    var assurancePolicies = <PolicyItemWidget>[];
    if (assuranceFilters.isNotEmpty) {
      for (var value in assuranceFilters) {
        assurancePolicies.addAll(policies
            .where((element) => element.policyModel.policyAssurace
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList());
      }
    }

    if (statusFilters.isNotEmpty) {
      for (var value in statusFilters) {
        auxPolicies.addAll(assurancePolicies
            .where((element) => element.status.label
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList());
      }
    } else {
      auxPolicies = assurancePolicies;
    }

    if (filter.isEmpty) return auxPolicies;

    return auxPolicies
        .where((element) =>
            element.policyModel.policyNumber
                .toLowerCase()
                .contains(filter.toLowerCase()) ||
            element.status.label.toLowerCase().contains(filter.toLowerCase()) ||
            element.policyModel.policyAssurace
                .toLowerCase()
                .contains(filter.toLowerCase()) ||
            element.policyModel.policyName
                .toLowerCase()
                .contains(filter.toLowerCase()))
        .toList();
  }

  updateStatusFilter(String filter) {
    if (statusFilters.contains(filter)) {
      statusFilters.remove(filter);
      return;
    }
    statusFilters.add(filter);
    return;
  }

  updateAssuranceFilter(String filter) {
    if (assuranceFilters.contains(filter)) {
      assuranceFilters.remove(filter);
      return;
    }
    assuranceFilters.add(filter);
    return;
  }

  updateDateFilter(String startDate, String endDate) {
    var startDateTime = DateTime.parse(startDate);
    var endDateTime = DateTime.parse(endDate);
    if (statusFilters.isEmpty) {
      policies.where((element) {
        var policyDate = DateTime.parse(element.policyModel.date);
        return policyDate.isAfter(startDateTime) &&
            policyDate.isBefore(endDateTime);
      }).toList();
      return;
    }
    filteredPolicies.where((element) {
      var policyDate = DateTime.parse(element.policyModel.date);
      return policyDate.isAfter(startDateTime) &&
          policyDate.isBefore(endDateTime);
    }).toList();
    return;
  }
}
