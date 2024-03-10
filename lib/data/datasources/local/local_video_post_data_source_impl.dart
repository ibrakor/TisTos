import 'package:tistos/data/models/local_video_model.dart';
import 'package:tistos/domain/datasources/video_post_datasource.dart';
import 'package:tistos/domain/entities/video_post.dart';
import 'package:tistos/shared/data/local_video_post.dart';

class LocalVideoPostDataSource extends VideoPostDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 3));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
