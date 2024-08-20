import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibl_app/features/courses/data/datasource/ai_remote_datasource.dart';
import 'package:ibl_app/features/courses/presentation/bloc/ai_events.dart';

import 'ai_states.dart';

class AISearchBloc extends Bloc<AISearchEvent, AISearchState> {
  final AIRemoteDatasource repo = AIRemoteDatasource();

  AISearchBloc(super.initialState) {
    on<LoadAI>(_onLoadAIs);
  }

  void _onLoadAIs(LoadAI event, Emitter<AISearchState> emit) async {
    try {
      emit(AiLoading());
      var models = await repo.getAIs();
      emit(AiLoaded(aiSearchMetaDatas: models));
    } catch (ex) {
      emit(AiError());
    }
  }
}
