<html>
    <head>
        <meta charset="utf-8" />
        <title>Raspberry Pi - Camera rotate</title>
    </head>
 
    <body style="background-color: white;">
	<center>
	<img height="240" width = "320" src="http://172.17.84.240:8081/test.mjpg" />
	<br>
	<button id="myP" onmousedown="mouseDown(02)" onmouseup="mouseUp(02)">Backward</button>
	<button id="myP" onmousedown="mouseDown(03)" onmouseup="mouseUp(03)">Turn right</button>
	<button id="myP" onmousedown="mouseDown(34)" onmouseup="mouseUp(34)">Forward</button>
	<button id="myP" onmousedown="mouseDown(24)" onmouseup="mouseUp(24)">Turn left</button>
	<br>

<!------------------------------------------------ php -->
<?php
	//set the GPIO0, GPIO 2, GPIO3, GPIO4 mode to output		
	system("gpio mode 0 out");
	system("gpio write 0 0");
	system("gpio mode 2 out");
	system("gpio write 2 0");
	system("gpio mode 3 out");
	system("gpio write 3 0");
	system("gpio mode 4 out");
	system("gpio write 4 0");

	//-----update button status
	$output = shell_exec("cat temp");
	if ($output ==0) {
		echo ("<img id='status' height=48 width = 120 src='data/ON.png'/>");
	}
	else {
		echo ("<img id='status' height=48 width = 120 src='data/OFF.png'/>");
	}	
?>

	</center>
	 
<!------------------------------------------------ javascript -->
<script src="camera.js"></script>

    </body>
</html>

Camera_rotate.php (live footage of camera)
<?php

if (isset ( $_GET["rotate"] )) {
	$rotate = strip_tags ($_GET["rotate"]);
	$pin = strip_tags ($_GET["pin"]);
	
	//test if value is a number
	if ( (is_numeric($rotate)) && ($rotate <= 4) && ($rotate >= 0) ) {
		//--------------------------------------------backward
		if (($rotate == 1)&&($pin == 02)){
			// run back-ward
			shell_exec("echo 0 >temp");
			$rotate = 0;
			system("gpio write 0 0");
			system("gpio write 2 1");
			system("gpio write 3 0");
			system("gpio write 4 0");
		}
		else{
		if (($rotate == 0)&&($pin == 02)){
			// stop back-ward
			shell_exec("echo 1 >temp");
			$rotate = 1;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 4 0");
			}
		}
		//--------------------------------------------forward
		if (($rotate == 1)&&($pin == 34)){
			// run for-ward
			shell_exec("echo 0 >temp");
			$rotate = 0;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 1");
			system("gpio write 4 0");
		}
		else{
		if (($rotate == 0)&&($pin == 34)){
			// stop for-ward
			shell_exec("echo 1 >temp");
			$rotate = 1;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 4 0");
			}
		}
		//--------------------------------------------turn right
		if (($rotate == 1)&&($pin == 03)){
			// run turn-right
			shell_exec("echo 0 >temp");
			$rotate = 0;
			system("gpio write 0 1");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 4 0");
		}
		else{
		if (($rotate == 0)&&($pin == 03)){
			// stop for-ward
			shell_exec("echo 1 >temp");
			$rotate = 1;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 4 0");
			}
		}
		//--------------------------------------------turn left
		if (($rotate == 1)&&($pin == 24)){
			// run turn-left
			shell_exec("echo 0 >temp");
			$rotate = 0;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 4 1");
		}
		else{
		if (($rotate == 0)&&($pin == 24)){
			// stop for-left
			shell_exec("echo 1 >temp");
			$rotate = 1;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 4 0");
			}
		}
		echo($rotate);
	}
	else { echo ("fail, it's not number".$pin); }
} //print fail if cannot use values
else { echo ("fail"); }

?>
