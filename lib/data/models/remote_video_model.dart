// To parse this JSON data, do
//
//     final remoteVideoPost = remoteVideoPostFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

import 'package:tistos/domain/entities/video_post.dart';

String responseRemoteVideoPostToJson(ResponseRemoteVideoPost data) =>
    json.encode(data.toJson());

class ResponseRemoteVideoPost {
  final int page;
  final int perPage;
  final List<RemoteVideoPost> videos;
  final int totalResults;
  final String nextPage;
  final String url;

  ResponseRemoteVideoPost({
    required this.page,
    required this.perPage,
    required this.videos,
    required this.totalResults,
    required this.nextPage,
    required this.url,
  });

  factory ResponseRemoteVideoPost.fromJson(Map<String, dynamic> json) =>
      ResponseRemoteVideoPost(
        page: json["page"],
        perPage: json["per_page"],
        videos: List<RemoteVideoPost>.from(
            json["videos"].map((x) => RemoteVideoPost.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
        "total_results": totalResults,
        "next_page": nextPage,
        "url": url,
      };
}

class RemoteVideoPost {
  final int id;
  final int width;
  final int height;
  final int duration;
  final dynamic fullRes;
  final List<dynamic> tags;
  final String url;
  final String image;
  final dynamic avgColor;
  final User user;
  final List<VideoFile> videoFiles;
  final List<VideoPicture> videoPictures;

  RemoteVideoPost({
    required this.id,
    required this.width,
    required this.height,
    required this.duration,
    required this.fullRes,
    required this.tags,
    required this.url,
    required this.image,
    required this.avgColor,
    required this.user,
    required this.videoFiles,
    required this.videoPictures,
  });

  factory RemoteVideoPost.fromJson(Map<String, dynamic> json) =>
      RemoteVideoPost(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        duration: json["duration"],
        fullRes: json["full_res"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        url: json["url"],
        image: json["image"],
        avgColor: json["avg_color"],
        user: User.fromJson(json["user"]),
        videoFiles: List<VideoFile>.from(
            json["video_files"].map((x) => VideoFile.fromJson(x))),
        videoPictures: List<VideoPicture>.from(
            json["video_pictures"].map((x) => VideoPicture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "duration": duration,
        "full_res": fullRes,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "url": url,
        "image": image,
        "avg_color": avgColor,
        "user": user.toJson(),
        "video_files": List<dynamic>.from(videoFiles.map((x) => x.toJson())),
        "video_pictures":
            List<dynamic>.from(videoPictures.map((x) => x.toJson())),
      };

  VideoPost toVideoPostEntity() {
    int likes = randomBetween(1, 10000000);
    return VideoPost(
        caption: user.name,
        videoUrl: videoFiles.first.link,
        likes: likes,
        views: likes * 3);
  }
}

class User {
  final int id;
  final String name;
  final String url;

  User({
    required this.id,
    required this.name,
    required this.url,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class VideoFile {
  final int id;
  final String quality;
  final String fileType;
  final int width;
  final int height;
  final double fps;
  final String link;

  VideoFile({
    required this.id,
    required this.quality,
    required this.fileType,
    required this.width,
    required this.height,
    required this.fps,
    required this.link,
  });

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
        id: json["id"],
        quality: json["quality"],
        fileType: json["file_type"],
        width: json["width"],
        height: json["height"],
        fps: json["fps"]?.toDouble(),
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quality": quality,
        "file_type": fileType,
        "width": width,
        "height": height,
        "fps": fps,
        "link": link,
      };
}

class VideoPicture {
  final int id;
  final int nr;
  final String picture;

  VideoPicture({
    required this.id,
    required this.nr,
    required this.picture,
  });

  factory VideoPicture.fromJson(Map<String, dynamic> json) => VideoPicture(
        id: json["id"],
        nr: json["nr"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nr": nr,
        "picture": picture,
      };
}

int randomBetween(int x, int y) {
  var random = Random();
  return x + random.nextInt(y - x);
}
