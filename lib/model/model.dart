abstract class IModel {

  IModel();

  factory IModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

