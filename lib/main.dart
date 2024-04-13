import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tistos/config/theme/app_theme.dart';
import 'package:tistos/data/datasources/remote/remote_video_post_data_source_impl.dart';
import 'package:tistos/data/repositories/video_post_data_repository.dart';
import 'package:tistos/presentation/providers/discover_provider.dart';
import 'package:tistos/presentation/screens/discover/discover_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostDataRepository(
        videoPostDataSource: RemoteVideoPostDataSource());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'TisTos',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
