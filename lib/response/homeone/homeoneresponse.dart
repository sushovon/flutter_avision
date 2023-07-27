import 'newsanalysis.dart';

class HomeOneResponse {
  String? statusCode;
  String? message;
  NewsAnalysis? newsAnalysis;

  HomeOneResponse({this.statusCode, this.message, this.newsAnalysis});

  HomeOneResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    newsAnalysis = json['news_analysis'] != null
        ? NewsAnalysis.fromJson(json['news_analysis'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    if (newsAnalysis != null) {
      data['news_analysis'] = newsAnalysis!.toJson();
    }
    return data;
  }
}
