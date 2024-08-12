class TopicsModel {
  final int? id;
  final String? name;


  TopicsModel(
      {required this.id,
      required this.name,
    });

  factory TopicsModel.formJson(Map<String, dynamic> data) => TopicsModel(
    id: data['id'],
    name: data['name'],

      );

  static List<TopicsModel> formListOfJson(List data) {
    return List.from(data.map((e) => TopicsModel.formJson(e)).toList());
  }
}
