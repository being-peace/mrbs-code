<?php // -*-mode: PHP; coding:utf-8;-*-
namespace MRBS;

// Layout
$mrbs_company = "Hecken-mobil-E";
$vocab_override['en']['mrbs'] = "";
$vocab_override['de']['mrbs'] = "";
$confirmation_enabled=false;
unset($booking_types);
$min_booking_admin_level = 1;
$allow_cli = true;
$locale = "de-de";
$cli_language = "de";
$default_language_tokens = "de";
$weekstarts = 1;
$enable_registration=false;
$auth['only_admin_can_select_multiroom'] = true;

$custom_css_url = 'local/custom.css';

$vocab_override['de']["no_rooms_for_area"]  = "Der Bereich enthält keine Ressource";
$vocab_override['de']["select_room"]        = "Ressource auswählen";
$vocab_override['de']["ctrl_click"]         = "Strg-Taste plus Mausklick um mehr als eine Ressource auszuwählen";
$vocab_override['de']["edit_entry_nonexistent_room"] = "Sie versuchen einen Eintrag für eine Ressource zu erstellen, welcher " .
$vocab_override['de']["room"]               = "Ressource";
$vocab_override['de']["no_rooms_selected"]    = "Sie müssen eine Ressource wählen.";
$vocab_override['de']["match_room"]         = "Suche Ressource";
$vocab_override['de']["sort_room"]             = "Ressource";
$vocab_override['de']["rooms"]              = "Ressourcen";
$vocab_override['de']["addroom"]            = "Ressource hinzufügen";
$vocab_override['de']["norooms"]            = "Keine Ressourcen vorhanden.";
$vocab_override['de']["norooms_enabled"]    = "Keine Ressourcen aktiviert.";
$vocab_override['de']["editroom"]           = "Ressource bearbeiten";
$vocab_override['de']["viewroom"]           = "Ressource ansehen";
$vocab_override['de']["room_admin_email"]   = "E-Mail des Ressourceadministrators";
$vocab_override['de']["invalid_room"]            = "Ungültige Ressource!";
$vocab_override['de']["invalid_room_name"]  = "Dieser Ressourcename wurde in diesem Bereich bereits vergeben!";
$vocab_override['de']["sort_key_note"]           = "Dieser ist der Schlüssel zum Sortieren der Ressourcen";
                                    "und es können keine Ressourcen in ihm gebucht werden.   Bestehende Buchungen " .
$vocab_override['de']["disabled_room_note"]      = "Wird diese Ressource deaktiviert, wird er nicht mehr in der Kalenderansicht gezeigt " .
$vocab_override['de']["invalid_types_note"]      = "Dies sind Kategorien, die in dieser Ressource nicht verwendet werden dürfen.";
$vocab_override['de']["delarea"]            = "Sie müssen alle Ressourcen dieses Bereiches löschen, damit Sie den Bereich löschen können<p>";
$vocab_override['de']["area_room_settings"]        = "Bereiche und Ressourcen";
$vocab_override['de']["default_room_note"]         = "Ressource der bei fehlender LOCATION-Eigenschaft verwendet wird";
$vocab_override['de']["area_room_order_note"]      = "Reihenfolge der Bereichs- und Ressourcenamen in der LOCATION Eigenschaft";
$vocab_override['de']["area_room"]                 = "Bereich - Ressource";
$vocab_override['de']["room_area"]                 = "Ressource - Bereich";
$vocab_override['de']["area_room_delimiter_note"]  = "Trenn-Zeichen für die Bereichs- und Ressourcenamen in der LOCATION Eigenschaft.  " .
                                      "Wird kein Trenn-Zeichen erkannt, wird nach einem eindeutige Ressource mit dem selben " .
$vocab_override['de']["area_room_create"]          = "Ressourcen anlegen, wenn notwendig";
$vocab_override['de']["room_does_not_exist_no_area"] = "Ressource existiert nicht - kein Bereich vorhanden";
$vocab_override['de']["room_not_unique_no_area"]     = "Ressourcename nicht eindeutig. Ohne Bereichsangabe keine Zuordnung möglich.";
$vocab_override['de']["room_does_not_exist"]       = "Ressource existiert nicht:";
$vocab_override['de']["creating_new_room"]         = "Ressource wird angelegt:";
$vocab_override['de']["could_not_create_room"]     = "Ressource konnte nicht angelegt werden";
$vocab_override['de']["could_not_find_room"]       = "Ressource wurde nicht gefunden";


$timezone = "Europe/Paris";
$dbsys = "mysql";

require("access.inc");
