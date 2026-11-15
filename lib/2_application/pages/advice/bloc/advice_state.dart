sealed class AdviceState {}

final class AdviceInitial extends AdviceState {}

final class AdviceLoading extends AdviceState {}

final class AdviceLoaded extends AdviceState {
  AdviceLoaded(this.advice);

  final String advice;
}

final class AdviceError extends AdviceState {
  AdviceError(this.message);

  final String message;
}
