import 'package:flutter_3_advicer/2_application/pages/advice/bloc/advice_event.dart';
import 'package:flutter_3_advicer/2_application/pages/advice/bloc/advice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceLoading());
      debugPrint('AdviceRequestedEvent received. Fetching advice...');
    });
  }
}
