abstract class AppState{}

class LoadingState extends AppState{}
class ErrorState extends AppState{
  final String message;

  ErrorState(this.message);
}
class LoadedState extends AppState{
  final dynamic data;

  LoadedState(this.data);
}
class EmptyState extends AppState{}
class InitState extends AppState{}