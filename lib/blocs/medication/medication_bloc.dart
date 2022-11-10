import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/respository/medications.dart';

import '../../models/problems_data.dart';

part 'medication_event.dart';

part 'medication_state.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  MedicationBloc(MedicationRepository medicationRepository)
      : _medicationRepository = medicationRepository,
        super(MedicationLoadedState()) {
    on<GetMedicationEvent>(_handleGetMedicationEvent);
  }

  final MedicationRepository _medicationRepository;

  FutureOr<void> _handleGetMedicationEvent(GetMedicationEvent event, Emitter<MedicationState> emit) async {

    emit(MedicationLoadedState());
    var data = await _medicationRepository.getMedications();
    if(data!=null) {
      emit(MedicationDataState(data.medications));
    } else {
      emit(MedicationErrorState("Failed to load medications"));
    }
  }
}
