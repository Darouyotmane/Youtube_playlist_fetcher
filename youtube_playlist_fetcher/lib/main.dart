import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/youtube_play_list_view.dart';
import 'package:get_it/get_it.dart';

import 'data/data_source/remote_data_source.dart';
import 'data/repository/repository_imp.dart';
import 'domain/repository/repository.dart';
final getIt = GetIt.instance;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube PlayList',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const YoutubePlayListView(),
    );
  }
}
// Helper function to inject dependencies
Future<void> injectDependencies() async {
  // Inject the data sources.
  getIt.registerLazySingleton(() => RemoteDataSourceImp());

  // Inject the Repositories. Note that the type is the abstract class
  // and the injected instance is the implementation.
  getIt.registerLazySingleton<Repository>(() => RepositoryImp());

}
