// Login Exceptions
class UserNotFoundAuthException implements Exception {}
class WrongPasswordAuthException implements Exception {}

// RegisterExceptions
class WeakPasswordAuthException implements Exception {}
class EmailAlreadyInUseAuthException implements Exception {}
class InvalidEmailAuthException implements Exception {}

// Generic Auth Exceptions
class GenericAuthException implements Exception {}
class UserNotLoggedInAuthException implements Exception {}