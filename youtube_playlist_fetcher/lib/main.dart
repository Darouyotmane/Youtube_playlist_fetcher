import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_playlist_fetcher/presentation/controllers/guide_items_cubit.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/colors_manager.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/guide_screen.dart';
import 'package:get_it/get_it.dart';

import 'data/data_source/guide_remote_data_source.dart';
import 'data/repository/guide_repository_imp.dart';
import 'domain/repository/repository.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => GuideItemsCubit())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YouTube Data Api PlaylistItems',
          theme: ThemeData(
            appBarTheme:
                AppBarTheme(color: AppColors.primaryColor, centerTitle: true),
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
          home: const GuideScreen(),
        ));
  }
}

// Helper function to inject dependencies
Future<void> injectDependencies() async {
  getIt.registerLazySingleton(() => GuideRemoteDataSourceImp());
  getIt.registerLazySingleton<GuideRepository>(() => GuideRepositoryImp());
}
