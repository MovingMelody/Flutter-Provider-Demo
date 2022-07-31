// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:state_demo/models/data_model.dart';

class LogicState extends ChangeNotifier {
  LogicState();

  final _dataUrl = Uri.parse("https://jsonplaceholder.typicode.com/todos");
  bool _isFetching = false;
  List<DataModel> _internetData = [];

  bool get isFetching => _isFetching;

  List<DataModel> get getData => _internetData;

  // call this method to fetch data, If data persisted in app state then api will not be called
  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();
    
    if (_internetData.isNotEmpty) {
      print("data already fetched no need to fetch again");
      _isFetching = false;
      notifyListeners();
      return;
    }
    _internetData = await getDataFromAPI();
    _isFetching = false;
    notifyListeners();
  }

  /// fetch data service
  Future<List<DataModel>> getDataFromAPI() async {
    List<DataModel> tempList = [];
    try {
      var res = await http.get(_dataUrl);
      var jsonResponse = jsonDecode(res.body);
      print('calling api to fetch data');
      var dataFromApi = jsonResponse;
      dataFromApi.forEach((e) {
        tempList.add(DataModel.fromMap(e));
      });
      print(tempList);
      return tempList;
    } catch (e) {
      print('Error while calling api $e');
      return [];
    }
  }
}
