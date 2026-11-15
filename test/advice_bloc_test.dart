import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_3_advicer/1_domain/repositories/advice_repository.dart';
import 'package:flutter_3_advicer/2_application/pages/advice/bloc/advice_bloc.dart';
import 'package:flutter_3_advicer/2_application/pages/advice/bloc/advice_event.dart';
import 'package:flutter_3_advicer/2_application/pages/advice/bloc/advice_state.dart';
import 'package:flutter_3_advicer/0_data/repositories/advice_repository_impl.dart';

void main() {
  test('emits loading and loaded states when advice is fetched', () async {
    final bloc = AdviceBloc(_FakeAdviceRepository('Take a deep breath.'));
    final states = expectLater(
      bloc.stream,
      emitsInOrder([
        isA<AdviceLoading>(),
        isA<AdviceLoaded>().having(
          (state) => state.advice,
          'advice',
          'Take a deep breath.',
        ),
      ]),
    );

    bloc.add(AdviceRequestedEvent());

    await states;
    await bloc.close();
  });

  test('emits an error state when advice fetching fails', () async {
    final bloc = AdviceBloc(_FailingAdviceRepository());
    final states = expectLater(
      bloc.stream,
      emitsInOrder([
        isA<AdviceLoading>(),
        isA<AdviceError>().having(
          (state) => state.message,
          'message',
          'Advice unavailable.',
        ),
      ]),
    );

    bloc.add(AdviceRequestedEvent());

    await states;
    await bloc.close();
  });
}

class _FakeAdviceRepository implements AdviceRepository {
  _FakeAdviceRepository(this.advice);

  final String advice;

  @override
  Future<String> fetchAdvice() async => advice;
}

class _FailingAdviceRepository implements AdviceRepository {
  @override
  Future<String> fetchAdvice() async {
    throw const AdviceFetchException('Advice unavailable.');
  }
}
