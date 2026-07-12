import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

void main() async {
  try {
    final doc = pw.Document();
    doc.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.UrlLink(
            destination: 'https://scholar.google.com/q=hello world[x]', // invalid url character
            child: pw.Text('Test link hello'),
          ),
        ];
      },
    ));
    await File('test_output.pdf').writeAsBytes(await doc.save());
    print('Success');
  } catch (e) {
    print('Failed: $e');
  }
}
