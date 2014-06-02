<?php
        $success = zint_barcode_file(
            98, // barcode type (zint -t shows posible type values)
            "123456", // input data
            "/tmp/test.png", // output file
            90, // rotate_angle
            array(
                "height" => 75,
                //"whitespace_width" => 10,
                //"border_width" => 15,
                //"output_options" => "box",
                //"output_options" => "bind",
                //"fgcolour" => "00ff00",
                //"bgcolour" => "ff00ff",
                //"scale" => 10.2,
                //"input_mode" => "data",
                //"input_mode" => "unicode",
                //"input_mode" => "gs1",
                //"primary" => "lala",
            )
        );
        if ($success === TRUE) {
            echo "successful" . "\n";
	    exit(0);
        } else {
            echo $success . "\n";
	    exit(1);
        }
?>
