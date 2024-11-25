import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la20_bloc/bloc/appEvent.dart';
import 'package:la20_bloc/bloc/appState.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  /*AppBloc() : super(InitialState(0)) {
    on<IncrementCounter>((event, emit) {
      if (state is InitialState) {
        emit(UpdateState((state as InitialState).initialValue + 1));
      } else if (state is UpdateState) {
        emit(UpdateState((state as UpdateState).newValue + 1));
      }
    });

    on<DecrementCounter>((event, emit) { // Handle decrement event
      if (state is InitialState) {
        emit(UpdateState((state as InitialState).initialValue - 1));
      } else if (state is UpdateState) {
        emit(UpdateState((state as UpdateState).newValue - 1));
      }
    });
    }*/

  int counter = 0;
  AppBloc() : super(InitialState(0)) {
    // Register event handlers
    on<IncrementCounter>(_handleIncrement);
    on<DecrementCounter>(_handleDecrement);
  }

  // Method to handle increment event
  void _handleIncrement(IncrementCounter event, Emitter<AppState> emit) {
    counter += event.value; // Use custom increment value
    emit(UpdateState(counter));
  }

  // Method to handle decrement event
  void _handleDecrement(DecrementCounter event, Emitter<AppState> emit) {
    counter -= event.value; // Use custom decrement value
    emit(UpdateState(counter));
  }
}