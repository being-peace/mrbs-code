<?php
// Wrapper to call create a specific report

header('Content-type: text/calendar; charset=utf-8');
header('Content-Disposition: inline; filename=cal_export.ics');

echo shell_exec("/usr/bin/php report.php output_format=2 roommatch=Volvo");

exit;