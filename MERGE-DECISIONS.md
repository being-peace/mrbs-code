# Merge-Entscheidungen: MRBS 1.12.2

Ziel dieses Merge-Branches ist das Hochziehen von `elkato` auf den aktuellen
MRBS-Release-Tag `v1.12.2`.

## Konfliktentscheidungen

- `web/edit_entry_handler.php`: Die aktuelle Release-Prüfung mit
  `is_book_admin()` und die Prüfung auf ein fehlendes `$create_by` bleiben
  erhalten. Die ältere `may_edit_and_view_all_bookings()`-Prüfung gehört zur
  abgelösten Berechtigungslogik.
- `web/import.php`: Die neue ICalendar-Implementierung des Releases ersetzt
  den alten Parser. Die lokale Option zum Löschen aller Buchungen im
  Standardraum wurde in die neue Importmaske übernommen und bleibt
  standardmäßig ausgeschaltet. Wird sie bewusst aktiviert, werden die
  Buchungen dieses Raums vor dem Import gelöscht. Die frühere
  `area_room_parsing`-Sondervariable wurde nicht übernommen; sie hatte keine
  sichtbare Formsteuerung und wird vom Release nicht verwendet.
- `web/lang/lang.de` und `web/lang/lang.en`: Release-Texte für
  Importoptionen bleiben erhalten; die lokale Option zum Löschen der
  Standardraum-Buchungen bleibt ebenfalls übersetzt. In Deutsch wurde der
  Platzhalter für die maximale Uploadgröße ergänzt und ein Tippfehler
  korrigiert.
- `web/style.inc`: Die neue Release-Funktion `link_html()` bleibt bestehen;
  die lokalen Favicon-Links wurden ergänzt.
- `web/functions_table.inc`: Die Datei wurde im Release durch
  `MRBS\Calendar`-Klassen ersetzt. Die Anzeige des Buchungs-Erstellers und
  die lokale Sperre für Räume mit ungültigem Typ `E` wurden in
  `CalendarMultislot` bzw. `CalendarMultislotDay` übernommen.
- `web/functions_ical.inc` und `web/language.inc`: Die alten Dateien wurden
  im Release entfernt und durch die ICalendar-Klassen bzw. die neue
  System-/Sprachverwaltung abgelöst. Die lokalen Änderungen daran wurden
  nicht als Legacy-Dateien wiederhergestellt.
