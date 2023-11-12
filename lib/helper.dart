class Helper {
  doubleGreat(String value) {
    if (!value.contains(".")) {
      List list = value.split("");

      value = value.replaceFirst(list.first, "${list.first}.");
    } else {
      value = value;
    }
    return value;
  }
}
