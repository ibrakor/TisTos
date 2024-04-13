import 'package:dio/dio.dart';
import 'package:tistos/data/models/remote_video_model.dart';
import 'package:tistos/domain/datasources/video_post_datasource.dart';
import 'package:tistos/domain/entities/video_post.dart';

class RemoteVideoPostDataSource extends VideoPostDataSource {
  final _apiPath =
      'https://api.pexels.com/videos/popular?page=1&min_height=4096&per_page=20';
  final _apiKey = 'txrRlcEa0lTr1djJMUgG5POA0sfU9E4cHBuJBPXQjX1ou892NC1Wfx2A';
  final _dio = Dio();

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    final dio = _dio;
    dio.options.headers['Authorization'] = _apiKey;
    final response = await dio.get(_apiPath);
    final videosResponse = ResponseRemoteVideoPost.fromJson(response.data);

    final filteredVideos = videosResponse.videos
        .where((video) => video.height > video.width)
        .toList();
    final videos = filteredVideos.map((e) => e.toVideoPostEntity()).toList();
    return videos;
  }
}
