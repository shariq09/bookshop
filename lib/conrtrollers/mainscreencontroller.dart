import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var categories = <Map<String, dynamic>>[].obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
  

  Future<void> fetchCategories() async {
    try {
      categories.clear();
      QuerySnapshot categorySnapshot =
          await firestore.collection('categories').get();

      for (var categoryDoc in categorySnapshot.docs) {
        String categoryId = categoryDoc.id;
        String categoryName = categoryDoc['categoryName'];
        String authorName = categoryDoc['author'];
        CollectionReference booksCollection = firestore
            .collection('categories')
            .doc(categoryId)
            .collection('books');
        QuerySnapshot booksSnapshot = await booksCollection.get();
        List<Map<String, dynamic>> books = [];
        for (var productDoc in booksSnapshot.docs) {
          books.add({
            'booksId': productDoc.id,
            ...productDoc.data() as Map<String, dynamic>,
          });
        }
        categories.add({
          "categoryId": categoryId,
          'categoryName': categoryName,
          'author': authorName,
          'books': books
        });
      }
      log(categories.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
