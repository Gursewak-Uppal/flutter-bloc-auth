import 'package:equatable/equatable.dart';

class MedicationsResponseData extends Equatable {
  final List<MedicationsData>? medications;

  const MedicationsResponseData({this.medications});

  MedicationsResponseData copyWith({List<MedicationsData>? medications}) => MedicationsResponseData(medications: medications ?? this.medications);

  factory MedicationsResponseData.fromMap(Map<String, dynamic> json) {
    List<MedicationsData> medicationsList = [];
    if (json.containsKey("problems")) {
      json["problems"].forEach((element) {
        element.forEach((problemName, problemValue) {
          if(problemValue!=null) {
            problemValue.forEach((problemData) {
              if (problemData != null && problemData.containsKey("medications")) {
                var medicationList = problemData["medications"];
                for (Map<String, dynamic>? medications in medicationList) {
                  if (medications != null && medications.containsKey("medicationsClasses")) {
                    for (Map<String, dynamic>? medicationClassData in medications["medicationsClasses"]){
                      if(medicationClassData!=null) {
                        medicationClassData.forEach((className, classDataList) {
                          if (classDataList != null) {
                            for (Map<String, dynamic> classData in classDataList) {
                              classData.forEach((associatedBy, associatedByDataList) {
                                if (associatedByDataList != null) {
                                  associatedByDataList.forEach((var data) {
                                    if (data != null) {
                                      data.putIfAbsent("problemName", () => problemName as String);
                                      data.putIfAbsent("className", () => className);
                                      data.putIfAbsent("associatedBy", () => associatedBy);
                                      medicationsList.add(MedicationsData.fromMap(data));
                                    }
                                  });
                                }
                              });
                            }
                          }
                        });
                      }
                    }
                  }
                }
              }
            });}
        });
      });
    }

    return MedicationsResponseData(medications: medicationsList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [medications];
}

class MedicationsData extends Equatable {
  const MedicationsData({
    this.problemName,
    this.className,
    this.associatedBy,
    this.name,
    this.dose,
    this.strength,
  });

  final String? problemName;
  final String? className;
  final String? associatedBy;
  final String? name;
  final String? dose;
  final String? strength;

  MedicationsData copyWith({
    String? problemName,
    String? className,
    String? associatedBy,
    String? name,
    String? dose,
    String? strength,
  }) =>
      MedicationsData(
        problemName: problemName ?? this.problemName,
        className: className ?? this.className,
        associatedBy: associatedBy ?? this.associatedBy,
        name: name ?? this.name,
        dose: dose ?? this.dose,
        strength: strength ?? this.strength,
      );

  factory MedicationsData.fromMap(Map<String, dynamic> json) => MedicationsData(
        problemName: json["problemName"],
        className: json["className"],
        associatedBy: json["associatedBy"],
        name: json["name"],
        dose: json["dose"],
        strength: json["strength"],
      );

  Map<String, dynamic> toMap() => {
        "problemName": problemName,
        "className": className,
        "associatedBy": associatedBy,
        "name": name,
        "dose": dose,
        "strength": strength,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [problemName, className, name, dose, strength, associatedBy];
}
