class HomeData {
  late final int id;
  late final String name;
  late final String tag;
  late final String color;
  late final List<Criteria> criteria;

  HomeData(
      {required this.id,
      required this.name,
      required this.tag,
      required this.color,
      required this.criteria});

  HomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      criteria = <Criteria>[];
      json['criteria'].forEach((v) {
        criteria.add(Criteria.fromJson(v));
      });
    }
  }
}

class Criteria {
  late final String type;
  late final String text;
  late final Map<String, VariableData>? variable;

  Criteria({
    required this.type,
    required this.text,
    this.variable,
  });

  Criteria.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
    if (json['variable'] != null) {
      variable = <String, VariableData>{};
      json['variable'].keys.forEach((key) {
        variable![key] = VariableData.fromJson(json['variable'][key]);
      });
    }
  }
}

class VariableData {
  late final String type;
  late final List<String>? values;
  late final String? studyType;
  late final String? parameterName;
  late final int? minValue;
  late final int? maxValue;
  late final int? defaultValue;

  VariableData(
      {required this.type,
      this.values,
      this.studyType,
      this.parameterName,
      this.minValue,
      this.maxValue,
      this.defaultValue});

  VariableData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['values'] != null) {
      values = <String>[];
      json['values'].forEach((v) => values!.add(v.toString()));
    }
    studyType = json['study_type'];
    parameterName = json['parameter_name'];
    minValue = json['min_value'];
    maxValue = json['max_value'];
    defaultValue = json['default_value'];
  }
}
