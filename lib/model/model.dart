abstract class IModel {
  String get id;

  IModel();

  factory IModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

