import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

blockCard() {
  return BlockCard();
}

cardBlockingInProcess() {
  return BlocProvider<CardBlockingBloc>(
    create: (context) => CardBlockingBloc(DI.inject<CardBlockingRepository>()),
    child: CardBlockingInProcess(),
  );
}
