import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multiple_bottomNavigationBar/models/fiji_model.dart';

abstract class FijiEvent extends Equatable {
  const FijiEvent();

  @override
  List<Object> get props => [];
}

class FijiGetEvent extends FijiEvent {
  final BuildContext context;

  FijiGetEvent({this.context});

  @override
  String toString() => 'FijiGetEvent';
}

class FijiPostEvent extends FijiEvent {
  final BuildContext context;
  final FijiModel fijiModel;

  FijiPostEvent({this.context, this.fijiModel});

  @override
  String toString() => 'FijiPostEvent';
}
