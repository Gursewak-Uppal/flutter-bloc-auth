part of 'medication_bloc.dart';

@immutable
abstract class MedicationState extends Equatable {}

class MedicationLoadedState extends MedicationState {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class MedicationDataState extends MedicationState {
   final List<MedicationsData>? medications;

  MedicationDataState(this.medications);

  @override
  // TODO: implement props
  List<Object?> get props =>[medications];
}

class MedicationErrorState extends MedicationState {
  final String msg;

  MedicationErrorState(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props =>[msg];
}
