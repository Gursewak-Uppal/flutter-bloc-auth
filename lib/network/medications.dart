import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_auth/models/problems_data.dart';
import 'package:flutter_bloc_auth/respository/medications.dart';
import 'package:http/http.dart' as http;

import 'medication_client.dart';

class MedicationNetwork implements MedicationRepository {
  var client = MedicationClient(http.Client());

  @override
  Future<MedicationsResponseData?> getMedications() async {
    try {
      http.Response response = await client.get(Uri.https('run.mocky.io', 'v3/cab477c3-50fd-427d-a667-1bcc1181ff38'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        MedicationsResponseData medicationsResponseData = MedicationsResponseData.fromMap(data);
        return medicationsResponseData;
      } else {
        return loadMedicationFromJson();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<MedicationsResponseData?> loadMedicationFromJson() async {
    try {
      final String response = await rootBundle.loadString('assets/json/medications.json');
      var data = json.decode(response);
      MedicationsResponseData medicationsResponseData = MedicationsResponseData.fromMap(data);
      return medicationsResponseData;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
