import 'package:flutter/cupertino.dart';
import 'package:fun_pluz/model/classes.dart';

class HumorDataProvider with ChangeNotifier {
  List<HumorJokesApi> post = [];
  bool loading = false;

  getPostData(context,category) async {
    loading = true;
    post = await getListHumorData(context,category);
    loading = false;

    notifyListeners();
  }
}