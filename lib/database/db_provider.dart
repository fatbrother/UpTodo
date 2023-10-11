import 'package:cloud_firestore/cloud_firestore.dart';

// we use this class to control the database
// not suspect to use this class directly
// to use other classes in this folder
// just import this file
class DB {
  static final _db = FirebaseFirestore.instance;

  // get the table of the database
  static Future<List<Map<String, dynamic>>> getTable(String tableName) async {
    if (tableName == '') {
      throw Exception('Invalid parameters');
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _db.collection(tableName).get();
      return querySnapshot.docs.isEmpty
          ? []
          : querySnapshot.docs
              .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                  doc.data())
              .toList();
    } catch (e) {
      rethrow;
    }
  }

  // get the row of the database
  static Future<Map<String, dynamic>> getRow(
      String tableName, String rowId) async {
    if (tableName == '' || rowId == '') {
      throw Exception('Invalid parameters');
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _db.collection(tableName).get();
      return querySnapshot.docs.isEmpty
          ? {}
          : querySnapshot.docs
              .firstWhere((element) => element.id == rowId)
              .data();
    } catch (e) {
      rethrow;
    }
  }

  // update the row of the database
  static Future<void> updateRow(
      String tableName, String rowId, Map<String, dynamic> row) async {
    if (tableName == '' || rowId == '' || row.isEmpty) {
      throw Exception('Invalid parameters');
    }
    try {
      await _db.collection(tableName).doc(rowId).set(row);
    } catch (e) {
      rethrow;
    }
  }

  // delete the row of the database
  static Future<void> deleteRow(String tableName, String rowId) async {
    if (tableName == '' || rowId == '') {
      throw Exception('Invalid parameters');
    }
    try {
      await _db.collection(tableName).doc(rowId).delete();
    } catch (e) {
      rethrow;
    }
  }

  // add the row of the databases
  static Future<String> addRow(
      String tableName, Map<String, dynamic> row) async {
    if (tableName == '' || row.isEmpty) {
      throw Exception('Invalid parameters');
    }
    try {
      // if the row has an id, use it
      if (row.containsKey('id') && row['id'] != null && row['id'] != '') {
        await _db.collection(tableName).doc(row['id']).set(row);
        return row['id'];
      } else {
        // if the row has no id, generate one
        final DocumentReference<Map<String, dynamic>> docRef =
            await _db.collection(tableName).add(row);
        _db.collection(tableName).doc(docRef.id).update({'id': docRef.id});
        return docRef.id;
      }
    } catch (e) {
      rethrow;
    }
  }
}