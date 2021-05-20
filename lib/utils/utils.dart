import 'dart:math';

/// function used to check how is the guess related to the number to be guessed
/// num : number to be guessed
/// guess : user input
/// returns a string that represents how is num compared to guess (lower, equal or higher)
String checkNumber(int num, int guess){
  String strGuess = guess.toString();
  if (num ==  guess){
    return "Well done";
  }
  if(num < guess){

    return 'You tried $strGuess.\n Try lower';
  }
  return 'You tried $strGuess.\n Try higher';
}

/// function used to generate a random number between 1 and 100
/// return a random integer int the specified range
int getRandom(){
  Random rnd;
  int min = 1;
  int max = 100;
  rnd = new Random();
  int r = min + rnd.nextInt(max - min);
  return r;
}