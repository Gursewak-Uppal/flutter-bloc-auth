import 'package:flutter_bloc_auth/models/problems_data.dart';

abstract class MedicationRepository{
  Future<MedicationsResponseData?> getMedications();
}