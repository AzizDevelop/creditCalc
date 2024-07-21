import 'dart:io' as io;
import 'dart:convert';
void main(List<String> arguments) {
  initSettings();
  if (arguments.firstWhere((arg) => arg == 'settings', orElse: () => '') != '') {
    printSettings();
    return;
  }

  // io.stdout.write('Enter first number: ');
  // final num1 = int.tryParse(io.stdin.readLineSync() ?? '') ?? 0;
  // io.stdout.write('Enter second number: ');
  // final num2 = int.tryParse(io.stdin.readLineSync() ?? '') ?? 0;


  // print('The summ is = ${num1 + num2}!');
//------------------------------------

  Map<String, dynamic> settings = readSettings();

  double do1 = settings['do1'];
  double do2 = settings['do2'];
  double do3 = settings['do3'];

  double pr1 = settings['pr1'];
  double pr2 = settings['pr2'];
  double pr3 = settings['pr3'];
  double pr4 = settings['pr4'];
  
  double awansPr = settings['awans_pr'];
  
  //------------------------------------
  double awansSum =0;
  double summaPokupki = 300;

  int kreditMes = 6;

  double sumCredit = 0;
  double kajdyyMes =0;

  if (summaPokupki <= do1) {
    sumCredit = (summaPokupki /100 * pr1) + summaPokupki;
  } else if (summaPokupki > do1 && summaPokupki <= do2) {
    sumCredit = (summaPokupki /100 * pr2) + summaPokupki;
  } else if (summaPokupki > do2 && summaPokupki <= do3) {
    sumCredit = (summaPokupki /100 * pr3) + summaPokupki;
  } else {
    sumCredit = (summaPokupki /100 * pr4) + summaPokupki;
  }

  awansSum = (sumCredit /100) * awansPr;
  kajdyyMes = (sumCredit-awansSum) / kreditMes;

  print(
    'Summa kredita: $sumCredit\n'
    'Summa awansa: $awansSum\n'
    'Kajdyy mesac: $kajdyyMes'
  );
}

void initSettings() {
  bool fileExist = io.File('cr_settings.json').existsSync();
  if (fileExist) {
    return;    
  } 
  Map<String, double> m = {
    "do1": 500,
    "do2": 1300,
    "do3": 2500,
    "pr1": 100,
    "pr2": 70,
    "pr3": 55,
    "pr4": 35,
    "awans_pr": 30
   };
final jsonEnc = JsonEncoder.withIndent('  ');
  String json = jsonEnc.convert(m);
  io.File('cr_settings.json').writeAsStringSync(json);
}

void updateSettings() {

}

Map<String, dynamic> readSettings() {
  String rJson = io.File('cr_settings.json').readAsStringSync();
  return jsonDecode(rJson);
}

void printSettings() {
 Map<String, dynamic> settings = readSettings();
 print(
  'Do 1 = : ${settings['do1']}\n'
  'Do 2 = : ${settings['do2']}\n'
  'Do 3 = : ${settings['do3']}\n'
  'Pr 1 = : ${settings['pr1']}\n'
  'Pr 2 = : ${settings['pr2']}\n'
  'Pr 3 = : ${settings['pr3']}\n'
  'Pr 4 = : ${settings['pr4']}\n'
  'Awans Pr = : ${settings['awans_pr']}\n'
 );

}