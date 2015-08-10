<?php

// current.php returns the temp from the hardware sensor in oF format

//Open temperature sensor, you will need to update this
$file = fopen("/sys/bus/w1/devices/28-000006b54028/w1_slave", "ro") or die ("0");
$temp = fread($file,filesize("/sys/bus/w1/devices/28-000006b54028/w1_slave"));
fclose($file);

//Find temperature info, jump to position for int
$pos = strpos($temp, 't');
$temp = substr($temp, $pos+2);

//Convert value to oF cause 'murica
$temp = $temp / 1000;
$temp = $temp * (9/5) + 32;

//Return
echo $temp;
?>
