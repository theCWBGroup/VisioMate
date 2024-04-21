import 'dart:async';

Map<String, dynamic> globalMap = {};

Timer? mapFlushTimer;

void startMapFlushTimer() {
  mapFlushTimer = Timer.periodic(Duration(seconds: 15), (timer) {
    globalMap.clear();
  });
}

void cancelMapFlushTimer() {
  mapFlushTimer?.cancel();
}
