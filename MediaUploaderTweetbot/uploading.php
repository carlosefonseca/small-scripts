<?php
// This is a very simple, custom made media uploader for Tweetbot
// It expects jpg's or mp4's, saves the files on the folder containing this script
// and returns a "shortened" URL that points to the index.php


//error_reporting(-1);

$fileID = getId();

if (strpos($_FILES['media']['type'], "jpeg")) {
  $uploadfile = $fileID.".jpg";
} else if (strpos($_FILES['media']['type'], "mp4")) {
  $uploadfile = $fileID.".mp4";
}

if (move_uploaded_file($_FILES['media']['tmp_name'], $uploadfile)) {
    echo "<mediaurl>http://example.com/?$fileID</mediaurl>\n";
} else {
    echo "Fail\n";
}

// Reads the last id used from "curr.txt", increments and saves
function getId() {
    $fn = "curr.txt";
    $fp = fopen($fn,"r+");
    $a = fread($fp, 100);
    $new = inc(rtrim($a));
    rewind($fp);
    fwrite($fp, $new);
    fclose($fp);
    return $new;
}

// Increments a string.
// Chars go from 0-9,a-z,A-Z
function inc($a, $p = 0) {
    $l = strlen($a);
    $b = ord($a[$l-$p-1]);
    switch ($b) {
        case ord("9"): $b = ord("a"); break;
        case ord("z"): $b = ord("A"); break;
        case ord("Z"): $b = ord("0"); break;
        default: $b++;
    }
    
    $c = chr($b);
    $a[$l-$p-1] = $c;
    if ($c == "0") {
        if ($l > $p+1) {
            $t = inc($a, $p+1);
            $a = $t;
        } else {
            return "0".$a;
        }
    }
    return $a;
}