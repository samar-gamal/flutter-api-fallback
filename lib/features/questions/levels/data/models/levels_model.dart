class LevelsModel {
  final int? id;
  final String? name;


  LevelsModel(
      {required this.id,
      required this.name,
    });

  factory LevelsModel.formJson(Map<String, dynamic> data) => LevelsModel(
    id: data['id'],
    name: data['name'],

      );

  static List<LevelsModel> formListOfJson(List data) {
    return List.from(data.map((e) => LevelsModel.formJson(e)).toList());
  }
}
