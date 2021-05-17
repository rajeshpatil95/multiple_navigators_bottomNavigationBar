import 'package:equatable/equatable.dart';
import 'package:multiple_bottomNavigationBar/models/fiji_model.dart';

abstract class FijiState extends Equatable {
  @override
  List<Object> get props => [];
}

//Get Loan Plans
class OnFijiGetInitialState extends FijiState {
  OnFijiGetInitialState();
}

class OnFijiGetLoadingState extends FijiState {
  OnFijiGetLoadingState();
}

class OnFijiGetSuccessState extends FijiState {
  final FijiModel fijiModel;

  OnFijiGetSuccessState({this.fijiModel});
}

class OnFijiGetFailureState extends FijiState {
  OnFijiGetFailureState();
}

//Evaluate Loan
class OnFijiPostInitialState extends FijiState {
  OnFijiPostInitialState();
}

class OnFijiPostLoadingState extends FijiState {
  OnFijiPostLoadingState();
}

class OnFijiPostSuccessState extends FijiState {
  OnFijiPostSuccessState();
}

class OnFijiPostFailureState extends FijiState {
  OnFijiPostFailureState();
}
