PrintWriter outputx, debug;
String testfile = "test.txt";
String search = "existence";
int sentences = 10;
int sentenceLength = 10;
void setup()
{
  outputx = createWriter("output.txt");
  String output = "";
  String[] res = split(join(loadStrings("dictionary.txt"), "\n").replace(",", ""), "\n");
  String test2 = join(loadStrings(testfile), "\n");
  String total = "";
  for (int y = 0; y != sentences; y++) {
    String input = search;
    for (int x = 0; x != sentenceLength; x++) {
      output = divide(meaning(word(word(meaning(divide(word(input, res), test2), res), res), res), res), test2) + " ";
      input = output;
      total += output;
    }
    total += "\n";
  }
  outputx = createWriter("output.txt");
  outputx.println(total);
  outputx.flush();
  outputx.close();
  exit();
}

String divide(String proc, String dic) {
  String word = "";
  String[] state = split(proc, " ");
  for (int x = 0; x < 1000; x++) {
    int rand = round(random(state.length-1));
    if (dic.indexOf("\n" + state[rand] + "\n") > -1) {
      word = state[rand];
      break;
    }
  }
  return word;
}
String word(String meaning, String[] res) {
  String ret = "";
  meaning = meaning.replace(",", "");
  for (int x = 0; x < 1000; x++) {
    int y = round(random(res.length-1));
    String[] array = split(res[y], "|");
    if (array.length-1 == 1) {
      if (meaning.indexOf(" " + array[0] + " ") > -1) {
        ret = split(res[y], "|")[0];
        break;
      }
    }
  }
  return ret;
}
String meaning(String word, String[] res) {
  String ret = "";
  for (int x = 0; x < 1000; x++) {
    int y = round(random(res.length-1));
    String[] array = split(res[y], "|");
    if (array.length-1 == 1) {
      if (array[1].replace(",", "").indexOf(" " + word + " ") >-1) {
        ret = split(res[y], "|")[1];
        break;
      }
    }
  }
  return ret;
}
