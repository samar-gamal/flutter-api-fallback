class LanguagesModel {
  final int? id;
  final String? name;


  LanguagesModel(
      {required this.id,
      required this.name,
    });

  factory LanguagesModel.formJson(Map<String, dynamic> data) => LanguagesModel(
    id: data['id'],
    name: data['name'],

      );

  static List<LanguagesModel> formListOfJson(List data) {
    return List.from(data.map((e) => LanguagesModel.formJson(e)).toList());
  }
}
