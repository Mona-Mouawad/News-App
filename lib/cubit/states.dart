abstract class states {}
 
class initstates extends states {} 

class changebuttomnav extends states {}

class loadingBusiness extends states {}

class errorBusiness extends states {
  final String? error;
  errorBusiness(this.error);
}

class getBusiness extends states {}

class loadingscience extends states {}

class errorscience extends states {
  final String? error;
  errorscience(this.error);
}

class getscience extends states {}

class loadingsports extends states {}

class errorsports extends states {
  final String? error;
  errorsports(this.error);
}

class getsports extends states {}

class changeBrightness extends states {}

class loadingsearch extends states {}
class Successearch extends states {}
class errorsearch extends states {
  final String? error;
  errorsearch(this.error);
}

class getsearch extends states {}