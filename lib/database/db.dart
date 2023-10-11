import 'package:todo_list_sample/model/model.dart';
import 'package:todo_list_sample/database/db_provider.dart';

abstract class ServiceBase<T extends IModel> {
  String get tableName;
  T fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }
}

mixin QueryAll<T extends IModel> on ServiceBase<T> {
  Future<List<T>> queryAll() async {
    try {
      final List<Map<String, dynamic>> table = await DB.getTable(tableName);
      return table.map((e) => fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

mixin Query<T extends IModel> on ServiceBase<T> {
  Future<T> query(String id) async {
    try {
      final Map<String, dynamic> row = await DB.getRow(tableName, id);
      if (row.isEmpty) return fromMap({});
      return fromMap(row);
    } catch (e) {
      rethrow;
    }
  }
}

mixin Update<T extends IModel> on ServiceBase<T> {
  Future<void> update(T model) async {
    try {
      await DB.updateRow(
        tableName,
        model.id,
        model.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }
}

mixin Delete<T extends IModel> on ServiceBase<T> {
  Future<void> delete(String id) async {
    try {
      await DB.deleteRow(tableName, id);
    } catch (e) {
      rethrow;
    }
  }
}

mixin Add<T extends IModel> on ServiceBase<T> {
  Future<String> add(T model) async {
    try {
      String id = await DB.addRow(tableName, model.toMap());
      return id;
    } catch (e) {
      rethrow;
    }
  }
}