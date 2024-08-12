class SpecificitiesModel {
  final int? id;
  final String? name;


  SpecificitiesModel(
      {required this.id,
      required this.name,
    });

  factory SpecificitiesModel.formJson(Map<String, dynamic> data) => SpecificitiesModel(
    id: data['id'],
    name: data['name'],

      );

  static List<SpecificitiesModel> formListOfJson(List data) {
    return List.from(data.map((e) => SpecificitiesModel.formJson(e)).toList());
  }
}
