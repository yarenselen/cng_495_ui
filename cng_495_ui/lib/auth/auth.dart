// temp auth class for testing purposes in local development
bool localAuth({
  required String login,
  required String password,
}) {
  if (login == 'admin' && password == 'admin.123') {
    return true;
  } else {
    return false;
  }
}
