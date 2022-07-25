// Helper functions to create a logger for the app

// imports
import 'dart:developer';
import 'package:logging/logging.dart';

// log level constant
const logLevel = Level.FINE;

// function to create a logger
Logger createLogger(String name) {
  // create and return a logger instance
  final Logger logger = Logger(name);
  Logger.root.level = logLevel;
  Logger.root.onRecord.listen(printLogRecord);
  return logger;
}

// function to print the formatted log to the console
void printLogRecord(LogRecord r) {
  log("${r.loggerName} (${r.level}) --- ${r.message}");
}
