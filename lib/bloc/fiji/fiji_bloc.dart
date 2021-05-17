import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:multiple_bottomNavigationBar/bloc/fiji/fiji_event.dart';
import 'package:multiple_bottomNavigationBar/bloc/fiji/fiji_state.dart';
import 'package:multiple_bottomNavigationBar/models/fiji_model.dart';
import 'package:multiple_bottomNavigationBar/webservice/fiji.dart/fiji_repository.dart';

class FijiBloc extends Bloc<FijiEvent, FijiState> {
  final FijiRepository fijiRepository;

  FijiBloc(this.fijiRepository) : super(OnFijiGetInitialState());

  FijiModel fijiModel = new FijiModel();
  FijiModel fijiModel1 = new FijiModel();

  @override
  Stream<FijiState> mapEventToState(FijiEvent event) async* {
    if (event is FijiGetEvent) {
      yield OnFijiGetInitialState();
      yield OnFijiGetLoadingState();
      try {
        this.fijiModel = await fijiRepository.getFiji("");
        print("FijiGetEvent Success: ");

        yield OnFijiGetSuccessState(fijiModel: fijiModel);
      } catch (e) {
        yield OnFijiGetFailureState();
      }
    } else if (event is FijiPostEvent) {
      yield OnFijiPostInitialState();
      yield OnFijiPostLoadingState();
      try {
        this.fijiModel1 = await fijiRepository.postFiji(event.fijiModel);
        print("FijiPostEvent Success: ");

        yield OnFijiPostSuccessState();
      } catch (e) {
        yield OnFijiPostFailureState();
      }
    }
  }
}
