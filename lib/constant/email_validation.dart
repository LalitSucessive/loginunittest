class EmailFieldValidator {
  static String? validate(value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}
