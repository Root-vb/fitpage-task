class HomeData {
  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criteria>? criteria;

  HomeData({this.id, this.name, this.tag, this.color, this.criteria});

  HomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      criteria = <Criteria>[];
      json['criteria'].forEach((v) {
        criteria!.add(new Criteria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tag'] = this.tag;
    data['color'] = this.color;
    if (this.criteria != null) {
      data['criteria'] = this.criteria!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Criteria {
  String? type;
  String? text;
  Variable? variable;

  Criteria({this.type, this.text, this.variable});

  Criteria.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
    // variable = json['variable'] != null
    //     ? new Variable.fromJson(json['variable'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['text'] = this.text;
    // if (this.variable != null) {
    //   data['variable'] = this.variable!.toJson();
    // }
    return data;
  }
}

class Variable {
  VariableType? v1;

  Variable({this.v1});

  Variable.fromJson(Map<String, dynamic> json) {
    print("JSON HOME DATA : $json");

    v1 = json['\$1'] != null ? new VariableType.fromJson(json['\$1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.v1 != null) {
      data['\$1'] = this.v1!.toJson();
    }
    return data;
  }
}

class VariableType {
  String? type;
  List<int>? values;

  VariableType({this.type, this.values});

  VariableType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    values = json['values'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['values'] = this.values;
    return data;
  }
}
