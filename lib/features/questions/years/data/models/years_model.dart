class YearsModel {
  final int? id;
  final int? year;


  YearsModel(
      {required this.id,
      required this.year,
    });

  factory YearsModel.formJson(Map<String, dynamic> data) => YearsModel(
    id: data['id'],
    year: data['year'],

      );

  static List<YearsModel> formListOfJson(List data) {
    return List.from(data.map((e) => YearsModel.formJson(e)).toList());
  }
}
