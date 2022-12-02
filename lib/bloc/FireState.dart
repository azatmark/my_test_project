class FireStringState {}

class LoadingFireString extends FireStringState {}

class FireStringSuccess extends FireStringState {
  final String fireString;
  FireStringSuccess({
    required this.fireString,
  });
}

class FireStringFailure extends FireStringState {
  final Exception exception;
  FireStringFailure({required this.exception});
}
