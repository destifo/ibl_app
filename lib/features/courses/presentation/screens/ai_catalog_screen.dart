import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibl_app/core/core.dart';
import 'package:ibl_app/core/presentation/screens/no_connection_widget.dart';
import 'package:ibl_app/features/courses/presentation/bloc/ai_bloc.dart';
import 'package:ibl_app/features/courses/presentation/bloc/ai_events.dart';
import 'package:ibl_app/features/courses/presentation/bloc/ai_states.dart';
import 'package:ibl_app/features/courses/presentation/screens/ai_detail_screen.dart';

class AiCatalogScreen extends StatelessWidget {
  const AiCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Catalog'),
      ),
      body: BlocConsumer<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state is Online) {
            BlocProvider.of<AISearchBloc>(context).add(LoadAI());
          }
        },
        builder: (context, state) {
          if (state is Offline) {
            return const NoConnectionWidget();
          }
          if (state is Online) {
            return BlocBuilder<AISearchBloc, AISearchState>(
                builder: (context, state) {
              if (state is AiLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AiLoaded) {
                return ListView.builder(
                  itemCount: state.aiSearchMetaDatas.length,
                  itemBuilder: (context, index) {
                    final catalogue = state.aiSearchMetaDatas[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: catalogue.profileImage!,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          title: Text(catalogue.name!),
                          subtitle: Text(catalogue.description!),
                          onTap: () {
                            // Navigate to AI detail screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AiDetailScreen(aiSearchMetaData: catalogue),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              } else if (state is AiError) {
                return const Center(
                  child: Text('Failed to fetch AI data'),
                );
              }
              return const Center(
                child: Text('Failed to fetch AI data'),
              );
            });
          }

          return const Text('Something in bloc state went wrong');
        },
      ),
    );
  }
}
