import 'package:flutter/material.dart';
import 'package:mvvm_assignment/User_ListView.dart';
import 'package:mvvm_assignment/User_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MvvM_asses());
}

class MvvM_asses extends StatelessWidget {
  const MvvM_asses({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel()..loadUsers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserListView(),
        
      ),
    );
  }
}




import 'package:flutter/material.dart';

class Home_scrn extends StatefulWidget {
  const Home_scrn({super.key});

  @override
  State<Home_scrn> createState() => _Home_scrnState();
}

class _Home_scrnState extends State<Home_scrn> {
  // Patient info Controllers
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController(); // Dropdown
  final dateOfBirthController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final emergencyContactController = TextEditingController();
  final dateOfExaminationController = TextEditingController();
  final referingPhysicianController = TextEditingController();
  final medicalRecordNumberController = TextEditingController();

  // Vital Signs controllers
  final systolicController = TextEditingController();
  final diastolicController = TextEditingController();
  final heartRateController = TextEditingController();
  final respiratoryRateController = TextEditingController();
  final temperatureController = TextEditingController();
  final spo2Controller = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  // Chief Complaints controllers
  final symptomsController = TextEditingController();
  final prevTreatmentController = TextEditingController();

  // Temporal Factors controllers
  final suddenOnsetController = TextEditingController();
  final gradualOnsetController = TextEditingController();
  final acuteSymptomsController = TextEditingController();
  final chronicSymptomsController = TextEditingController();
  final intermittentController = TextEditingController();
  final gradualProgressionController = TextEditingController();
  final remittingController = TextEditingController();
  final frequencyOfSymptomsController = TextEditingController(); // Dropdown
  final timingOfSymptomsController = TextEditingController(); // Dropdown

  // Present Medical History controllers
  final onsetController = TextEditingController(); // Dropdown
  final locationController = TextEditingController(); // Dropdown
  final characteristicsController = TextEditingController(); // Dropdown
  final durationController = TextEditingController(); // Dropdown
  final aggravatingFactorsController = TextEditingController(); // Dropdown
  final relievingFactorsController = TextEditingController(); // Dropdown

  // Treatment controllers
  final reason1_Controller = TextEditingController();
  final reason2_Controller = TextEditingController();
  final reason3_Controller = TextEditingController();

  // Past Medical History controllers
  final chronicIllnessController = TextEditingController();
  final specifyChronicIllnessController = TextEditingController();
  final reason4_Controller = TextEditingController();
  final reason5_Controller = TextEditingController();
  final reason6_Controller = TextEditingController();
  final reason7_Controller = TextEditingController();
  final reason8_Controller = TextEditingController();
  final reason9_Controller = TextEditingController();
  final reason10_Controller = TextEditingController();
  final reason11_Controller = TextEditingController();

  // Family Medical History controllers
  final historyOfIllnessController = TextEditingController();
  final specifyHistoryOfIllnessController = TextEditingController();
  final reason12_Controller = TextEditingController();
  final reason13_Controller = TextEditingController();

  // Social History controllers
  final livingSituationController = TextEditingController();
  final occupationController = TextEditingController();

  // Lifestyle Factors controllers
  final exerciseController = TextEditingController();
  final reason14_Controller = TextEditingController();
  final reason15_Controller = TextEditingController();
  final reason16_Controller = TextEditingController();
  final dietaryHabitsController = TextEditingController();

  // Environmental Factors controllers
  final reason17_Controller = TextEditingController();
  final reason18_Controller = TextEditingController();

  final reason19_Controller = TextEditingController();
  final reason20_Controller = TextEditingController();
  final reason21_Controller = TextEditingController();
  final reason22_Controller = TextEditingController();
  final reason23_Controller = TextEditingController();
  final reason24_Controller = TextEditingController();
  final reason25_Controller = TextEditingController();
  final reason26_Controller = TextEditingController();
  final reason27_Controller = TextEditingController();



  // Radio Buttons
  String _alleviateSymptoms = 'No';
  String _relieveSymptoms = 'No';
  String _soughtTreatment = 'No';
  String _pastSurgery = "No";
  String _medication = 'No';
  String _foods = 'No';
  String _infectiousDiseases = 'No';
  String _mentalDisorder = "No";
  String _immunizationHistory = 'Not up to date';
  String _currentMedicines = 'No';
  String _pastMedicines = 'No';
  String _hereditary = "No";
  String _mentalHealth = 'No';
  String _tobacco = 'No';
  String _alcohol = 'No';
  String _drug = "No";
  String _dietary = 'Unbalanced';
  String _pollutants = 'No';
  String _toxins = 'No';

  // Dropdown Fields
  String _selectedIllness = 'Hypertension';
  bool _showOtherField = false;
  String _historyIllness = 'Diabetes';
  String _livingSituation = "With Family"; // Ensure this matches one of the items
  String? _exerciseFrequency;

  // Stepper Variables
  int _currentStep = 0;
  bool _isLastStep = false;



void validate() {
  List<Map<String, dynamic>> fields = [
    {'controller': nameController, 'error': "Please fill in the Name"},
    {'controller': ageController, 'error': "Please fill in the Age"},
    {'controller': genderController, 'error': "Please select the Gender"},
    {'controller': dateOfBirthController, 'error': "Please enter the Date of Birth"},
    {'controller': emailController, 'error': "Please enter the Email"},
    {'controller': mobileController, 'error': "Please enter the Mobile number"},
    {'controller': emergencyContactController, 'error': "Please enter the Emergency Contact"},
    {'controller': dateOfExaminationController, 'error': "Please enter the Date of Examination"},
    {'controller': referingPhysicianController, 'error': "Please enter the Referring Physician"},
    {'controller': medicalRecordNumberController, 'error': "Please enter the Medical Record Number"},
    {'controller': systolicController, 'error': "Please enter Systolic Pressure"},
    {'controller': diastolicController, 'error': "Please enter Diastolic Pressure"},
    {'controller': heartRateController, 'error': "Please enter Heart Rate"},
    {'controller': respiratoryRateController, 'error': "Please enter Respiratory Rate"},
    {'controller': temperatureController, 'error': "Please enter Temperature"},
    {'controller': spo2Controller, 'error': "Please enter SPO2"},
    {'controller': heightController, 'error': "Please enter Height"},
    {'controller': weightController, 'error': "Please enter Weight"},
    {'controller': symptomsController, 'error': "Please enter Symptoms"},
    {'controller': prevTreatmentController, 'error': "Please enter Previous Treatment"},
    {'controller': suddenOnsetController, 'error': "Please enter Sudden Onset"},
    {'controller': gradualOnsetController, 'error': "Please enter Gradual Onset"},
    {'controller': acuteSymptomsController, 'error': "Please enter Acute Symptoms"},
    {'controller': chronicSymptomsController, 'error': "Please enter Chronic Symptoms"},
    {'controller': intermittentController, 'error': "Please enter Intermittent Symptoms"},
    {'controller': gradualProgressionController, 'error': "Please enter Gradual Progression"},
    {'controller': remittingController, 'error': "Please enter Remitting"},
    {'controller': frequencyOfSymptomsController, 'error': "Please enter Frequency of Symptoms"},
    {'controller': timingOfSymptomsController, 'error': "Please enter Timing of Symptoms"},
    {'controller': onsetController, 'error': "Please enter Onset"},
    {'controller': locationController, 'error': "Please enter Location"},
    {'controller': characteristicsController, 'error': "Please enter Characteristics"},
    {'controller': durationController, 'error': "Please enter Duration"},
    {'controller': aggravatingFactorsController, 'error': "Please enter Aggravating Factors"},
    {'controller': relievingFactorsController, 'error': "Please enter Relieving Factors"},
    {'controller': reason1_Controller, 'error': "Please fill in Reason 1"},
    {'controller': reason2_Controller, 'error': "Please fill in Reason 2"},
    {'controller': reason3_Controller, 'error': "Please fill in Reason 3"},
    {'controller': chronicIllnessController, 'error': "Please enter Chronic Illness"},
    {'controller': specifyChronicIllnessController, 'error': "Please specify Chronic Illness"},
    {'controller': historyOfIllnessController, 'error': "Please enter History of Illness"},
    {'controller': specifyHistoryOfIllnessController, 'error': "Please specify History of Illness"},
    {'controller': livingSituationController, 'error': "Please enter Living Situation"},
    {'controller': occupationController, 'error': "Please enter Occupation"},
    {'controller': exerciseController, 'error': "Please enter Exercise details"},
    {'controller': dietaryHabitsController, 'error': "Please enter Dietary Habits"},
    {'controller': reason4_Controller, 'error': "Please fill in Reason 4"},
    {'controller': reason5_Controller, 'error': "Please fill in Reason 5"},
    {'controller': reason6_Controller, 'error': "Please fill in Reason 6"},
    {'controller': reason7_Controller, 'error': "Please fill in Reason 7"},
    {'controller': reason8_Controller, 'error': "Please fill in Reason 8"},
    {'controller': reason9_Controller, 'error': "Please fill in Reason 9"},
    {'controller': reason10_Controller, 'error': "Please fill in Reason 10"},
    {'controller': reason11_Controller, 'error': "Please fill in Reason 11"},
    {'controller': reason12_Controller, 'error': "Please fill in Reason 12"},
    {'controller': reason13_Controller, 'error': "Please fill in Reason 13"},
    {'controller': reason14_Controller, 'error': "Please fill in Reason 14"},
    {'controller': reason15_Controller, 'error': "Please fill in Reason 15"},
    {'controller': reason16_Controller, 'error': "Please fill in Reason 16"},
    {'controller': reason17_Controller, 'error': "Please fill in Reason 17"},
    {'controller': reason18_Controller, 'error': "Please fill in Reason 18"},
    {'controller': reason19_Controller, 'error': "Please fill in Reason 19"},
    {'controller': reason20_Controller, 'error': "Please fill in Reason 20"},
    {'controller': reason21_Controller, 'error': "Please fill in Reason 21"},
    {'controller': reason22_Controller, 'error': "Please fill in Reason 22"},
    {'controller': reason23_Controller, 'error': "Please fill in Reason 23"},
    {'controller': reason24_Controller, 'error': "Please fill in Reason 24"},
    {'controller': reason25_Controller, 'error': "Please fill in Reason 25"},
    {'controller': reason26_Controller, 'error': "Please fill in Reason 26"},
    {'controller': reason27_Controller, 'error': "Please fill in Reason 27"}
  ];

    bool allFilled = true;
  String firstError = "";

  for (var field in fields) {
    if (field['controller'].text.trim().isEmpty) {
      allFilled = false;
      firstError = field['error'];
      break; // Show only the first error
    }
  }

  if (!allFilled) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(firstError),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  } else {
    print("All required fields are filled");
    // Proceed with the next step
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Assessment",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          Expanded(
            child: Stepper(
              
              // margin: EdgeInsets.all(20),
              
              currentStep: _currentStep,
              type: StepperType.horizontal, // Horizontal stepper
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step; // Allow tapping on steps
                });
              },
              // onStepContinue: () {
              //   setState(() {
              //     if (_currentStep < getSteps(context).length - 1) {
              //       _currentStep++;
              //     } else {
              //       _isLastStep = true;
              //     }
              //   });
              // },
              // onStepCancel: () {
              //   setState(() {
              //     if (_currentStep > 0) {
              //       _currentStep--;
              //     }
              //   });
              // },
              steps: getSteps(context),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              ElevatedButton(
                onPressed: () {
                  setState(() {
                  if (_currentStep > 0) {
                    _currentStep--;
                  }
                });
                },
                child: Text('Previous'),
              ),
              
              ElevatedButton(
                onPressed: () {
                  if (_isLastStep) {
                    // Save the form data here
                    print('Form Saved');
                  } else {
                    setState(() {
                      if (_currentStep < getSteps(context).length - 1) {
                        _currentStep++;
                        validate();
                      }
                    });
                  }
                },
                child: Text(_isLastStep ? 'Save' : 'Continue'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Step> getSteps(BuildContext context) {
    return [
      /// Step 1: Patient Information
      Step(
        stepStyle: StepStyle(connectorColor: Colors.black),
        state: _currentStep>0 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 0,
        title: Text('1'),
        content: Column(
          
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name",
              border: OutlineInputBorder(),
              ),
              
            ),

            SizedBox(height:10),

            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Age",
              border: OutlineInputBorder(),),
            ),

            SizedBox(height:10),

            DropdownButtonFormField<String>(
              value: genderController.text.isNotEmpty
                  ? genderController.text
                  : null,
              items: ['Male', 'Female', 'Transgender']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  genderController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Gender",
              border: OutlineInputBorder(),),
            ),

            SizedBox(height:10),

            TextField(
              controller: dateOfBirthController,
              decoration: InputDecoration(labelText: "Date of Birth",
              border: OutlineInputBorder(),),
            ),

            SizedBox(height:10),

            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email",border: OutlineInputBorder(),),
            ),

            SizedBox(height:10),

            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: "Mobile",border: OutlineInputBorder(),),
            ),

            SizedBox(height:10),

            TextField(
              controller: emergencyContactController,
              decoration: InputDecoration(labelText: "Emergency Contact",border: OutlineInputBorder(),),
            ),

            SizedBox(height:10),

            TextField(
              controller: dateOfExaminationController,
              decoration: InputDecoration(labelText: "Date of Examination",border: OutlineInputBorder(),),
            ),

            SizedBox(height:10),

            TextField(
              controller: referingPhysicianController,
              decoration: InputDecoration(labelText: "Referring Physician",border: OutlineInputBorder(),),
            ),

            SizedBox(height:10),

            TextField(
              controller: medicalRecordNumberController,
              decoration: InputDecoration(labelText: "Medical Record Number",border: OutlineInputBorder(),),
            ),

          ],
        ),
        
      ),

      /// Step 2: Vital Signs
      Step(
         state: _currentStep>1 ? StepState.complete : StepState.indexed,
         isActive: _currentStep >= 1,
        title: Text('2'),
        content: Column(
          children: [

            Text("Blood Pressure"),

            Row(
              children: [
                Expanded(

                  child: TextField(
                    controller: systolicController,
                    decoration: InputDecoration(labelText: "Systolic",border: OutlineInputBorder(),),
                  ),
                ),
                
                SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: diastolicController,
                    decoration: InputDecoration(labelText: "Diastolic",border: OutlineInputBorder(),),
                  ),
                ),
              ],
            ),
    SizedBox(height:10),
            TextField(
              controller: heartRateController,
              decoration: InputDecoration(labelText: "Heart Rate",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: respiratoryRateController,
              decoration: InputDecoration(labelText: "Respiratory Rate",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: temperatureController,
              decoration: InputDecoration(labelText: "Temperature",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: spo2Controller,
              decoration: InputDecoration(labelText: "SpO₂",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: "Height",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: "Weight",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: symptomsController,
              decoration: InputDecoration(labelText: "Symptoms",border: OutlineInputBorder(),),
            ),
            SizedBox(height:10),
            TextField(
              controller: prevTreatmentController,
              decoration: InputDecoration(labelText: "Previous Treatment & Responses",
              border: OutlineInputBorder(),),
            ),
          ],
        ),
        
      ),

      /// Step 3: Temporal Factors
      Step(
        state: _currentStep>2?StepState.complete: StepState.indexed,
        isActive: _currentStep >= 2,
        title: Text('3'),
        content: Column(
          children: [

            TextField(
              controller: suddenOnsetController,
              decoration: InputDecoration(labelText: "Sudden Onset",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: gradualOnsetController,
              decoration: InputDecoration(labelText: "Gradual Onset",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: acuteSymptomsController,
              decoration: InputDecoration(labelText: "Acute Symptoms",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: chronicSymptomsController,
              decoration: InputDecoration(labelText: "Chronic Symptoms",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: intermittentController,
              decoration: InputDecoration(labelText: "Intermittent Symptoms",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: gradualProgressionController,
              decoration: InputDecoration(labelText: "Gradual Progression",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            TextField(
              controller: remittingController,
              decoration: InputDecoration(labelText: "Remitting and Relapsing",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            DropdownButtonFormField<String>(
              value: frequencyOfSymptomsController.text.isNotEmpty
                  ? frequencyOfSymptomsController.text
                  : null,
              items: ['Constant', 'Occasional', 'Cyclical']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  frequencyOfSymptomsController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Frequency of Symptoms",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            DropdownButtonFormField<String>( ///reason feild 1
              value: timingOfSymptomsController.text.isNotEmpty
                  ? timingOfSymptomsController.text
                  : null,
              items: ['Time of Day', 'Post-Activity', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  timingOfSymptomsController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Timing of Symptoms",border: OutlineInputBorder(),),
            ),

          ],
        ),
        //isActive: _currentStep >= 3,
      ),

      /// Step 4: Present Medical History
      Step(
        state: _currentStep>3 ?StepState.complete: StepState.indexed,
        isActive: _currentStep >= 3,
        title: Text('4'),
        content: Column(
          children: [

            DropdownButtonFormField<String>( ///reason feild 2
              value: onsetController.text.isNotEmpty ? onsetController.text : null,
              items: ['Gradual', 'Sudden']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  onsetController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Onset",border: OutlineInputBorder(),),
            ),
            SizedBox(height:10),

            DropdownButtonFormField<String>( ///reason feild 3
              value: locationController.text.isNotEmpty ? locationController.text : null,
              items: ['Localized', 'Radiates']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  locationController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Location",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            DropdownButtonFormField<String>( ///reason feild 4
              value: characteristicsController.text.isNotEmpty
                  ? characteristicsController.text
                  : null,
              items: ['Sharp', 'Dull', 'Throbbing']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  characteristicsController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Characteristics",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            DropdownButtonFormField<String>( ///reason feild 5
              value: durationController.text.isNotEmpty ? durationController.text : null,
              items: ['Hours', 'Days', 'Weeks', 'Months']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  durationController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Duration",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            DropdownButtonFormField<String>(
              value: aggravatingFactorsController.text.isNotEmpty
                  ? aggravatingFactorsController.text
                  : null,
              items: ['Movement','Eating','Stress']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  aggravatingFactorsController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Aggravating Factors",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            DropdownButtonFormField<String>(  ///reason feild 6
              value: relievingFactorsController.text.isNotEmpty
                  ? relievingFactorsController.text
                  : null,
              items: ['Rest', 'Medication', 'Heat/Cold'] 
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  relievingFactorsController.text = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Relieving Factors",border: OutlineInputBorder(),),
            ),
SizedBox(height:10),
            Text(
              'Do any activities or treatments alleviate the symptoms?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16.0),

            Row(///reason feild 7
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _alleviateSymptoms,
                  onChanged: (value) {
                    setState(() {
                      _alleviateSymptoms = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _alleviateSymptoms,
                  onChanged: (value) {
                    setState(() {
                      _alleviateSymptoms = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_alleviateSymptoms == 'Yes')
              TextFormField(
                controller: reason1_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),

            Text(
              'Do any activities or treatments help relieve the symptoms?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16.0),

            Row(///reason feild 8
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _relieveSymptoms,
                  onChanged: (value) {
                    setState(() {
                      _relieveSymptoms = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _relieveSymptoms,
                  onChanged: (value) {
                    setState(() {
                      _relieveSymptoms = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_relieveSymptoms == 'Yes')
              TextFormField(
                controller: reason2_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),

              Text(
              'Treatment',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            Text(
              'Have you sought any treatment for these symptoms?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 16.0),

            Row(///reason feild 9
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _soughtTreatment,
                  onChanged: (value) {
                    setState(() {
                      _soughtTreatment = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _soughtTreatment,
                  onChanged: (value) {
                    setState(() {
                      _soughtTreatment = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_soughtTreatment == 'Yes')
              TextFormField(
                controller: reason3_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),

          ],
        ),
        //isActive: _currentStep >= 4,
      ),

      /// Step 5: Past Medical History
      Step(
        state: _currentStep>4 ?StepState.complete: StepState.indexed,
        isActive: _currentStep >= 4,
        title: Text('5'),
        content: Column(
          children: [
            
            DropdownButtonFormField<String>( ///reason feild 10
              value: _selectedIllness,
              items: ['Hypertension', 'Diabetes', 'Asthma', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedIllness = newValue!;
                  _showOtherField = newValue == 'Other';
                });
              },
              decoration: InputDecoration(labelText: "Chronic Illness",border: OutlineInputBorder(),),
            ),
            SizedBox(height:10),
            if (_showOtherField)
              TextFormField(
                controller: specifyChronicIllnessController,
                decoration: InputDecoration(
                  labelText: 'Specify illness',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'past surgeries:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 11
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _pastSurgery,
                  onChanged: (value) {
                    setState(() {
                      _pastSurgery = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _pastSurgery,
                  onChanged: (value) {
                    setState(() {
                      _pastSurgery = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_pastSurgery == 'Yes')
              TextFormField(
                controller: reason4_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
               SizedBox(height:10),
            Text(
              'Allergies:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:10),
            Text(///reason feild 12
              'Medications:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _medication,
                  onChanged: (value) {
                    setState(() {
                      _medication = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _medication,
                  onChanged: (value) {
                    setState(() {
                      _medication = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_medication == 'Yes')
              TextFormField(
                controller: reason4_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'Food',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 13
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _foods,
                  onChanged: (value) {
                    setState(() {
                      _foods = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _foods,
                  onChanged: (value) {
                    setState(() {
                      _foods = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_foods == 'Yes')
              TextFormField(
                controller: reason7_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'Infectious diseases?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 14
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _infectiousDiseases,
                  onChanged: (value) {
                    setState(() {
                      _infectiousDiseases = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _infectiousDiseases,
                  onChanged: (value) {
                    setState(() {
                      _infectiousDiseases = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_infectiousDiseases == 'Yes')
              TextFormField(
                controller: reason8_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'Mental disorders?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 15
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _mentalDisorder,
                  onChanged: (value) {
                    setState(() {
                      _mentalDisorder = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _mentalDisorder,
                  onChanged: (value) {
                    setState(() {
                      _mentalDisorder = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_mentalDisorder == 'Yes')
              TextFormField(
                controller: reason9_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'Immunization history ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 16
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _immunizationHistory,
                  onChanged: (value) {
                    setState(() {
                      _immunizationHistory = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _immunizationHistory,
                  onChanged: (value) {
                    setState(() {
                      _immunizationHistory = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_immunizationHistory == 'No')
              TextFormField(
                controller: reason10_Controller,
                decoration: InputDecoration(
                  labelText: 'If no, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'Current Medicines',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 17
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _currentMedicines,
                  onChanged: (value) {
                    setState(() {
                      _currentMedicines = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _currentMedicines,
                  onChanged: (value) {
                    setState(() {
                      _currentMedicines = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_currentMedicines == 'Yes')
              TextFormField(
                controller: reason11_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'past medicines?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 18
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _pastMedicines,
                  onChanged: (value) {
                    setState(() {
                      _pastMedicines = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _pastMedicines,
                  onChanged: (value) {
                    setState(() {
                      _pastMedicines = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_pastMedicines == 'Yes')
              TextFormField(
                controller: reason12_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
          ],
        ),
        //isActive: _currentStep >= 5,
      ),

      /// Step 6: Family Medical History
      Step(
        state: _currentStep>5 ?StepState.complete: StepState.indexed,
        isActive: _currentStep >= 5,
        title: Text('6'),
        content: Column(
          children: [
            DropdownButtonFormField<String>(///reason feild 19
              value: _historyIllness,
              items: ['Heart Diseases', 'Cancer', 'Diabetes', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _historyIllness = newValue!;
                  _showOtherField = newValue == 'Other';
                });
              },
              decoration: InputDecoration(labelText: "History of Illness",border: OutlineInputBorder(),),
            ),
            SizedBox(height:10),
            if (_showOtherField)
              TextFormField(
                controller: specifyHistoryOfIllnessController,
                decoration: InputDecoration(
                  labelText: 'Specify illness',
                  border: OutlineInputBorder(),
                ),
              ),
               SizedBox(height:10),
            Text(
              'Is there any hereditary condition in your family?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 20
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _hereditary,
                  onChanged: (value) {
                    setState(() {
                      _hereditary = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _hereditary,
                  onChanged: (value) {
                    setState(() {
                      _hereditary = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_hereditary == 'Yes')
              TextFormField(
                controller: reason13_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
               SizedBox(height:10),
            Text(
              'Do you have any mental health disorders in your family?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 21
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _mentalHealth,
                  onChanged: (value) {
                    setState(() {
                      _mentalHealth = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _mentalHealth,
                  onChanged: (value) {
                    setState(() {
                      _mentalHealth = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            SizedBox(height:10),
            if (_mentalHealth == 'Yes')
              TextFormField(
                controller: reason13_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
             SizedBox(height:10),

            DropdownButtonFormField<String>(///reason feild 22
              value: _livingSituation,
              items: ['With Family', 'Alone', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _livingSituation = newValue!;
                  _showOtherField = newValue == 'Other';
                });
              },
              decoration: InputDecoration(labelText: "Living Situation",border: OutlineInputBorder(),),
            ),
            SizedBox(height:10),
            if (_showOtherField)
              TextFormField(
                controller: reason14_Controller,
                decoration: InputDecoration(
                  labelText: 'Specify living situation',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            TextField(
              controller: occupationController,
              decoration: InputDecoration(labelText: "Occupation",border: OutlineInputBorder(),),
            ),

          ],
        ),
        //isActive: _currentStep >= 6,
      ),

/// Step -8-: Social History(thookun)
      // Step(
      //   state: _currentStep>7 ?StepState.complete: StepState.indexed,
      //   title: Text('8'),
      //   content: Column(
      //     children: [
      //       DropdownButtonFormField<String>(
      //         value: _livingSituation,
      //         items: ['With Family', 'Alone', 'Other']
      //             .map((String value) {
      //           return DropdownMenuItem<String>(
      //             value: value,
      //             child: Text(value),
      //           );
      //         }).toList(),
      //         onChanged: (String? newValue) {
      //           setState(() {
      //             _livingSituation = newValue!;
      //             _showOtherField = newValue == 'Other';
      //           });
      //         },
      //         decoration: InputDecoration(labelText: "Living Situation"),
      //       ),
      //       if (_showOtherField)
      //         TextFormField(
      //           controller: reason14_Controller,
      //           decoration: InputDecoration(
      //             labelText: 'Specify living situation',
      //             border: OutlineInputBorder(),
      //           ),
      //         ),
      //       TextField(
      //         controller: occupationController,
      //         decoration: InputDecoration(labelText: "Occupation"),
      //       ),
      //     ],
      //   ),
      //   isActive: _currentStep >= 7,
      // ),

      /// Step 7: Lifestyle Factors
      Step(
        state: _currentStep>6 ?StepState.complete: StepState.indexed,
        isActive: _currentStep >= 6,
        title: Text('7'),
        content: Column(
          children: [
            Text(
              'Tobacco Use',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 23
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _tobacco,
                  onChanged: (value) {
                    setState(() {
                      _tobacco = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _tobacco,
                  onChanged: (value) {
                    setState(() {
                      _tobacco = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_tobacco == 'Yes')
              TextFormField(
                controller: reason15_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'Alcohol Consumption',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 24
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _alcohol,
                  onChanged: (value) {
                    setState(() {
                      _alcohol = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _alcohol,
                  onChanged: (value) {
                    setState(() {
                      _alcohol = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_alcohol == 'Yes')
              TextFormField(
                controller: reason16_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            Text(
              'Recreational Drug Use',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 25
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _drug,
                  onChanged: (value) {
                    setState(() {
                      _drug = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _drug,
                  onChanged: (value) {
                    setState(() {
                      _drug = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_drug == 'Yes')
              TextFormField(
                controller: reason17_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
            DropdownButtonFormField<String>(
              value: _exerciseFrequency,
              items: ['Regularly', 'Occasionally', 'Never']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _exerciseFrequency = newValue!;
                });
              },
              decoration: InputDecoration(labelText: "Exercise Frequency",border: OutlineInputBorder(),),
            ),
            SizedBox(height:10),
            Text(
              'Dietary Habits',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Radio<String>(
                  value: 'Balanced',
                  groupValue: _dietary,
                  onChanged: (value) {
                    setState(() {
                      _dietary = value!;
                    });
                  },
                ),
                Text('Balanced'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'Unbalanced',
                  groupValue: _dietary,
                  onChanged: (value) {
                    setState(() {
                      _dietary = value!;
                    });
                  },
                ),
                Text('Unbalanced'),
              ],
            ),
SizedBox(height:10),
             Text(
              'Exposure to Pollutants',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 26
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _pollutants,
                  onChanged: (value) {
                    setState(() {
                      _pollutants = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _pollutants,
                  onChanged: (value) {
                    setState(() {
                      _pollutants = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_pollutants == 'Yes')
              TextFormField(
                controller: reason18_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),
SizedBox(height:10),
            Text(
              'Exposure to Toxins',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(///reason feild 27
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _toxins,
                  onChanged: (value) {
                    setState(() {
                      _toxins = value!;
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 32.0),
                Radio<String>(
                  value: 'No',
                  groupValue: _toxins,
                  onChanged: (value) {
                    setState(() {
                      _toxins = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (_toxins == 'Yes')
              TextFormField(
                controller: reason18_Controller,
                decoration: InputDecoration(
                  labelText: 'If yes, please specify',
                  border: OutlineInputBorder(),
                ),
              ),

          ],
        ),
        //isActive: _currentStep >= 8,
      ),


    

    ];
  }
}
