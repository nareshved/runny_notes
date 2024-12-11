import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runny_notes/data/bloc/runny_events.dart';
import 'package:runny_notes/data/bloc/runny_states.dart';

class RunnyBloc extends Bloc<RunnyEvents, RunnyStates> {
  RunnyBloc() : super(RunnyStates(mData: [])) {
    on<AddNoteEvent>(
      (event, emit) {
        var currData = state.mData;

        currData.add(event.addNote);

        emit(RunnyStates(mData: currData));
      },
    );

    on<FetchAllNotes>(
      (event, emit) {
        emit(RunnyStates(mData: state.mData));
      },
    );

    on<UpdateNoteEvent>(
      (event, emit) {
        var currData = state.mData;

        currData[event.uIndex] = event.updateNote;

        emit(RunnyStates(mData: currData));
      },
    );

    on<DeleteNoteEvent>(
      (event, emit) {
        var currData = state.mData;

        currData.removeAt(event.dIndex);

        emit(RunnyStates(mData: currData));
      },
    );
  }
}
