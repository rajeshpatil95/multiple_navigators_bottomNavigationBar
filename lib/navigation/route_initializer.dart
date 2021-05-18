import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bottomNavigationBar/bloc/fiji/fiji_bloc.dart';
import 'package:multiple_bottomNavigationBar/di/di_initializer.dart';
import 'package:multiple_bottomNavigationBar/presentation/tab5/fiji.dart';
import 'package:multiple_bottomNavigationBar/webservice/fiji.dart/fiji_repository.dart';

navigateToFiji() {
  return BlocProvider<FijiBloc>(
    create: (context) => FijiBloc(DI.inject<FijiRepository>()),
    child: FijiScreen(),
  );
}
