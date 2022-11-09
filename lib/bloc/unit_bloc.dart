import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'unit_event.dart';
part 'unit_state.dart';

class UnitBloc extends Bloc<UnitEvent, UnitState> {
  UnitBloc() : super(UnitInitial()) {
    on<UnitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
