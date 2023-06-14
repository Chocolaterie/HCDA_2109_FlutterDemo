
class EniValidator {

  static String? validationEmail(String? value){
    // Erreur : Length
    if (value!.length < 4){
      return "Erreur, le champ doit être supérieur à 4 caracteres";
    }

    // Erreur : Regex
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if(!emailValid) {
      return "Le format de l'email est incorrecte";
    }

    //--
    return null;
  }
}