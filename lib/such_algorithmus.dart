import 'dart:math';

void main() {
  // final list= [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // final unsortierteList = [10, 9, 8, 6, 7, 5, 2, 4, 1, 3];
  final listLange = 10000;
  final List<int> sortierteList = List.generate(listLange, (index) => index + 1);
  print('liner am bestenFall ${linearSuche(1, sortierteList)}');
  print('liner am schlechtestenFall ${linearSuche(listLange, sortierteList)}');
  print('binär am bestenFall ${binaereSuche(listLange ~/ 2, sortierteList)}');
  print('binär am schlechtestenFall ${binaereSuche(listLange, sortierteList)}');
  // print('binär um Zwei ${binaereSuche(2, sortierteList)}');
  // print('schlau um Zwei ${schlauSuche(2, sortierteList)}');
}

int linearSuche(int number, List<int> list) {
  final startTime = DateTime.now();
  int durchfuehrung = 0;
  for (int i = 0; i < list.length; i++) {
    durchfuehrung++;
    if (list[i] == number) {
      final endTime = DateTime.now();
      print('linearSuche Dauer: ${endTime.difference(startTime).inMicroseconds}');
      return durchfuehrung;
    }
  }
  return -1;
}

int binaereSuche(int number, List<int> list) {
  final startTime = DateTime.now();

  int durchfuehrung = 0;
  int min = 0;
  int max = list.length - 1;
  while (min <= max) {
    durchfuehrung++;
    final int mid = min + ((max - min) ~/ 2);
    if (list[mid] == number) {
      final endTime = DateTime.now();
      print('binareSuche Dauer: ${endTime.difference(startTime).inMicroseconds}');
      return durchfuehrung;
    } else if (list[mid] < number) {
      min = mid + 1;
    } else {
      max = mid - 1;
    }
  }

  return -1;
}

int schlauSuche(int number, List<int> list) {
  if (number < (log(list.length) / log(2))) {
    return linearSuche(number, list);
  }
  return binaereSuche(number, list);
}


/*

 */

class ComeLeave {
  final DateTime date;   // التاريخ مع الوقت (الدخول/الخروج)
  final int comeInOut;   // 0 = In, 1 = Out
  final int noPeople;    // عدد الأشخاص (مجموعة)

  ComeLeave({
    required this.date,
    required this.comeInOut,
    required this.noPeople,
  });

  int getDay() => date.day;       // 1..31
  int getHour() => date.hour;     // 0..23

  /// عدد أيام الشهر لهذا التاريخ
  int getDaysOfMonth() {
    final firstOfMonth = DateTime(date.year, date.month, 1);
    final firstOfNext  = DateTime(date.year, date.month + 1, 1);
    return firstOfNext.difference(firstOfMonth).inDays;
  }
}

/// يحسب مصفوفة [أيام × ساعات(9..18)] لعدد الزوار الموجودين بالحديقة.
List<List<int>> countVisitors(List<ComeLeave> entry) {
  if (entry.isEmpty) {
    // بشكل افتراضي نعيد شهراً بـ 31 يوماً صفرية
    return List.generate(31, (_) => List.filled(10, 0));
  }

  // نفترض أن كل السجلات لنفس الشهر (كما هو في نص المسألة).
  final any = entry.first.date;
  final daysInMonth = ComeLeave(date: any, comeInOut: 0, noPeople: 0).getDaysOfMonth();

  // مصفوفة الفروقات لِكُل يوم: 10 أعمدة للساعات 9..18
  // diff[d][hIdx] = صافي التغيير ابتداءً من هذه الساعة في ذلك اليوم.
  final diff = List.generate(daysInMonth, (_) => List.filled(10, 0));

  int? hourToIndex(int hour) {
    // 9 -> 0, 10 -> 1, ..., 18 -> 9
    if (hour < 9 || hour > 18) return null;
    return hour - 9;
  }

  for (final e in entry) {
    final d = e.getDay();                  // 1-based
    final dayIdx = d - 1;                  // 0-based row
    final h = e.getHour();
    final hIdx = hourToIndex(h);

    // نتجاهل الأحداث خارج مقاطع 9..18 (لا تغيّر أي مقطع).
    if (hIdx == null) continue;

    if (e.comeInOut == 0) {
      // دخول: يُحسب ابتداءً من هذه الساعة
      diff[dayIdx][hIdx] += e.noPeople;
    } else {
      // خروج: لا يُحسب ابتداءً من هذه الساعة
      diff[dayIdx][hIdx] -= e.noPeople;
    }
  }

  // الآن نحول diff إلى مصفوفة “موجودين فعلياً” عبر مجموع تراكمي لكل يوم.
  final result = List.generate(daysInMonth, (_) => List.filled(10, 0));
  for (int day = 0; day < daysInMonth; day++) {
    int cur = 0;
    for (int hIdx = 0; hIdx < 10; hIdx++) {
      cur += diff[day][hIdx];
      result[day][hIdx] = cur;
    }
  }

  return result;
}


//'########################################################
//'########################################################
//'########################################################
//'########################################################

class Abfahrtszeit {
  final DateTime datum;     // تاريخ اليوم
  final int haltestelleNr;  // رقم المحطة 1..16 (لأن Strecken = 15)
  final int planAbfahrt;    // وقت مخطط بالدقائق منذ منتصف الليل
  final int istAbfahrt;     // وقت فعلي بالدقائق منذ منتصف الليل
  // ملاحظة: لمحطة النهاية قد تكون هذه أوقات "وصول" بدل "مغادرة" كما في النص.

  Abfahrtszeit({
    required this.datum,
    required this.haltestelleNr,
    required this.planAbfahrt,
    required this.istAbfahrt,
  });
}

/// يعيد مصفوفة بطول 15: عدد التأخيرات (> 2 دقائق) لكل Strecke (0..14).
List<int> ermittleFahrzeiten(List<Abfahrtszeit> zeiten) {
  // عدّادات التأخير لكل Strecke
  final verspaetungen = List<int>.filled(15, 0);

  if (zeiten.length < 2) return verspaetungen;

  // نفترض أن البيانات مرتبة زمنيًا (كما هو شائع في مهام IHK)
  for (int i = 1; i < zeiten.length; i++) {
    final cur = zeiten[i];
    final prev = zeiten[i - 1];

    // نفس اليوم؟ إذا لا، لا توجد Strecke مستمرّة بينهما
    final sameDay =
        cur.datum.year == prev.datum.year &&
        cur.datum.month == prev.datum.month &&
        cur.datum.day == prev.datum.day;

    if (!sameDay) continue;

    // نحسب المدة المخططة والفعليّة بين المحطتين المتتاليتين
    final planDiff = cur.planAbfahrt - prev.planAbfahrt;
    final istDiff  = cur.istAbfahrt  - prev.istAbfahrt;

    // تأخير أكبر من دقيقتين؟
    if (istDiff > planDiff + 2) {
      final streckeIndex = cur.haltestelleNr - 1; // 1..16 -> 0..15
      if (streckeIndex >= 0 && streckeIndex < verspaetungen.length) {
        verspaetungen[streckeIndex]++;
      }
    }
  }

  return verspaetungen;
}


//##################################################
//##################################################
//##################################################
//##################################################
//##################################################

class Belegung {
  final int patientId;
  final DateTime datumVon; // يوم الدخول (مشمولة)
  final DateTime datumBis; // يوم الخروج (غير مشمولة)
  final int stationId;

  Belegung({
    required this.patientId,
    required this.datumVon,
    required this.datumBis,
    required this.stationId,
  });
}

class Station {
  final int stationId;
  final int anzahlBetten;
  Station({required this.stationId, required this.anzahlBetten});
}

/// يحسب عدد الأيام ضمن [startDatum..endDatum] التي بلغت فيها محطة معيّنة 80%+ إشغال.
int ermittleAuslastungsTage(
  List<Belegung> belegung,
  DateTime startDatum,
  DateTime endDatum,
  Station station,
) {
  // حارس بسيط ضد قسمة على صفر
  if (station.anzahlBetten <= 0) return 0;

  int anzahlAusgelasteteTage = 0;

  // نمشي يومًا بيوم: endDatum مشمول
  for (DateTime d = startOfDay(startDatum);
      !d.isAfter(endOfDay(endDatum));
      d = d.add(const Duration(days: 1))) {
    int anzahlBelegt = 0;

    for (final b in belegung) {
      if (b.stationId != station.stationId) continue;

      // إشغال اليوم d إذا كان d ضمن [von, bis)
      if (!d.isBefore(startOfDay(b.datumVon)) && d.isBefore(startOfDay(b.datumBis))) {
        anzahlBelegt++;
      }
    }

    final auslastung = anzahlBelegt / station.anzahlBetten;
    if (auslastung >= 0.8) {
      anzahlAusgelasteteTage++;
    }
  }

  return anzahlAusgelasteteTage;
}

/// توحيد وقت اليوم (للتعامل النظيف مع الساعات/الدقائق)
DateTime startOfDay(DateTime dt) => DateTime(dt.year, dt.month, dt.day);
DateTime endOfDay(DateTime dt) =>
    DateTime(dt.year, dt.month, dt.day, 23, 59, 59, 999);

