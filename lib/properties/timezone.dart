import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/models/double_property.dart';
import 'package:units_converter/models/property.dart';
import 'package:units_converter/models/unit.dart';

// Available TIMEZONE units.
// One option is to use the POSIX-style time zone format... lots of works.
// The "Time Zone Database" is likely too difficult to easily use in this application.
enum TIMEZONE {
  utc,
  pst,
  pdt,
  // mst,
  // mdt,
  // cst,
  // cdt,
  // est,
  // edt,
  // cet,
  // cest,
}

class TimeZone extends DoubleProperty<TIMEZONE> {
  TimeZone(
      {super.significantFigures,
      super.removeTrailingZeros,
      super.useScientificNotation,
      name})
      : super(
          name: name ?? PROPERTY.timezone,
          mapSymbols: {
            TIMEZONE.utc: 'UTC',
            TIMEZONE.pst: 'PST',
            TIMEZONE.pdt: 'PDT',
          },
          conversionTree: ConversionNode(name: TIMEZONE.utc, children: [
            ConversionNode(
              coefficientSum: -8,
              name: TIMEZONE.pst,
            ),
            ConversionNode(
              coefficientSum: -7,
              name: TIMEZONE.pdt,
            ),
          ]),
        );

  Unit get utc => getUnit(TIMEZONE.utc);
  Unit get pst => getUnit(TIMEZONE.pst);
  Unit get pdt => getUnit(TIMEZONE.pdt);
}
