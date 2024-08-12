class SystemsModel {
  final int? id;
  final String? name;


  SystemsModel(
      {required this.id,
      required this.name,
    });

  factory SystemsModel.formJson(Map<String, dynamic> data) => SystemsModel(
    id: data['id'],
    name: data['name'],

      );

  static List<SystemsModel> formListOfJson(List data) {
    return List.from(data.map((e) => SystemsModel.formJson(e)).toList());
  }
}
