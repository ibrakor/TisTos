import 'package:tistos/domain/datasources/video_post_datasource.dart';
import 'package:tistos/domain/entities/video_post.dart';
import 'package:tistos/domain/repositories/video_post_repository.dart';

class VideoPostDataRepository implements VideoPostRepository {
  final VideoPostDataSource videoPostDataSource;

  VideoPostDataRepository({required this.videoPostDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDataSource.getTrendingVideosByPage(page);
  }
}
