import 'package:logging/logging.dart';

// function to create a logger
Logger createLogger(String name, Level levellogLevel) {
  // create and return a logger instance
  final Logger logger = Logger(name);
  Logger.root.level = levellogLevel;
  Logger.root.onRecord.listen(printLogRecord);
  return logger;
}

// function to print the formatted log to the console
void printLogRecord(LogRecord r) {
  print("${r.loggerName} (${r.level}) --- ${r.message}");
}
