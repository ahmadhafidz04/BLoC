abstract class AppEvent {}

class IncrementCounter extends AppEvent {
  final int value;
  IncrementCounter(this.value);
}
class Increment2Counter extends AppEvent {}


class DecrementCounter extends AppEvent {
  final int value;
  DecrementCounter(this.value);
}