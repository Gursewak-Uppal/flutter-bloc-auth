import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/blocs/medication/medication_bloc.dart';
import 'package:flutter_bloc_auth/core/styles.dart';
import 'package:flutter_bloc_auth/models/problems_data.dart';
import '../core/constants.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({Key? key}) : super(key: key);

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  late final MedicationBloc _medicationBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _medicationBloc = context.read();
    _medicationBloc.add(GetMedicationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicationBloc, MedicationState>(
      builder: (context, state) {
        if (state is MedicationLoadedState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MedicationErrorState) {
          return Center(child: Text(state.msg));
        }
        if (state is MedicationDataState) {
          return _buildMedicationList(state);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildMedicationList(MedicationDataState state) {
    return ListView.builder(
        itemCount: (state.medications ?? []).length,
        itemBuilder: (context, index) {
          return _buildMedicationData(state.medications![index]);
        });
  }

  Widget _buildMedicationData(MedicationsData medicationsData) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all()),
      child: Column(
        children: [
          _buildMedicationDataItem(AppConstants.problemName, medicationsData.problemName ?? ""),
          const SizedBox(
            height: 5.0,
          ),
          _buildMedicationDataItem(AppConstants.className, medicationsData.className ?? ""),
          const SizedBox(
            height: 5.0,
          ),
          _buildMedicationDataItem(AppConstants.associatedBy, medicationsData.associatedBy ?? ""),
          const SizedBox(
            height: 5.0,
          ),
          _buildMedicationDataItem(AppConstants.medicineName, medicationsData.name ?? ""),
          const SizedBox(
            height: 5.0,
          ),
          _buildMedicationDataItem(AppConstants.medicineDose, medicationsData.dose ?? ""),
          const SizedBox(
            height: 5.0,
          ),
          _buildMedicationDataItem(AppConstants.medicineStrength, medicationsData.strength ?? "")
        ],
      ),
    );
  }

  Widget _buildMedicationDataItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: AppStyles.textMedicineTitle,
        ),
        Text(value)
      ],
    );
  }
}
