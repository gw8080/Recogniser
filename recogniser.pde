PrintWriter outputx, debug;
String resource = "reason.txt";
void setup()
{
  outputx = createWriter("output.txt");
  String output = "";
  int tries = 50000;
  String[] input = split(join(loadStrings(resource), ""), ".");
  String[] res = split(join(loadStrings("dictionary.txt"), "\n").replace(",", ""), "\n");
  for (int x = 0; x < input.length; x++) {
    output = input[x] + "\n";
    for (int y = 0; y < tries; y++) {
      int z = round(random(res.length-1));
      if (res[z].indexOf("|") > -1) {
        if (StringMatch(input[x], split(res[z], "|")[1], " ", 100) > 90 ) {
          output += split(res[z], "|")[0] + ", ";
        }
      }
    }
    output += "\n\n";
    outputx.print(output);
    outputx.flush();
  }
  outputx.close();
  exit();
}
int StringMatch(String one, String two, String splitToken, int tries) {

  String[] Background = split(one, splitToken);
  String[] match = split(two, splitToken);
  int state = 0;
  for (int a = 0; a < tries; a++) {
    if (func(Background, match, splitToken, 3, 0) == true) {
      state++;
    }
  }
  return state;
}

boolean func(String[] Background, String[] match, String splitToken, int size, int pos) {
  boolean state = false;
  String check ="";
  if (pos+size <= Background.length-1 && match.length-1 >= size+pos) {
    for (int a = pos; a < size; a++) {
      check += match[a] + splitToken;
    }
  }
  if (join(Background, splitToken).indexOf(check, pos) > -1 && check.length() > 0) {
    state = true;
  }
  return state;
}
