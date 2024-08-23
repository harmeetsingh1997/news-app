import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Data/model/news.dart';
import 'package:news_app/Data/model/some_root_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsModel> fetchNews();
  Future<SomeRootModel> fetchPopular();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImpl(this.client);

  @override
  Future<NewsModel> fetchNews() async {
    final Uri url = Uri.parse(
        'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=3UBcCuFsUnc62snhbzmGTcIBsNmfpMrT');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return NewsModel.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<SomeRootModel> fetchPopular() async {
    final Uri url = Uri.parse(
        'https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=3UBcCuFsUnc62snhbzmGTcIBsNmfpMrT');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return SomeRootModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
