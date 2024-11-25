abstract class AppState {}

class InitialState extends AppState {
  final int initialValue;
  InitialState(this.initialValue);
}

class UpdateState extends AppState {
  final int newValue;
  UpdateState(this.newValue);
}
