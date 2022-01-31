import 'dart:io';

Stream<int> intStream() async* {
  // While async gives you a Future,
  // async* gives you a Stream.
  // async* generates asynchronous data
  for (int i = 1; i < 10; i++) {
    print("Sent integer number: " + i.toString());
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  final envVarMap = Platform.environment;

  print('PWD = ${envVarMap['PWD']}');
  print('LOGNAME = ${envVarMap['LOGNAME']}');
  print('PATH = ${envVarMap['PATH']}');
  Stream<int> stream = intStream();

  stream.listen((receivedData) {
    print("Received integer number: " + receivedData.toString());
  });
}
