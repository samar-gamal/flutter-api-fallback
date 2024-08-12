class SubjectsModel {
  final int? id;
  final String? name;


  SubjectsModel(
      {required this.id,
      required this.name,
    });

  factory  SubjectsModel.formJson(Map<String, dynamic> data) =>  SubjectsModel(
    id: data['id'],
    name: data['name'],

      );

  static List< SubjectsModel> formListOfJson(List data) {
    return List.from(data.map((e) =>  SubjectsModel.formJson(e)).toList());
  }
}
