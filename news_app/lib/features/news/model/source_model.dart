class SourceModel {
  SourceModel({required this.id, required this.name});

  factory SourceModel.fromMap(Map<String, dynamic> map) {
    return SourceModel(id: map['id'] as String?, name: map['name'] as String);
  }

  final String? id;
  final String name;
}
