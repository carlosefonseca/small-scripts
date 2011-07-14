<?php
// This looks for an URL for media and redirects to it.
// If there's no URL of the file doesn't exist, shows the usual page

if (isset($_GET) && sizeof($_GET) == 1) {
    $a = array_keys($_GET);
    $fn = "imgs/".$a[0].".jpg";
    if (file_exists($fn)) {
        header("Location: $fn");
        die();
    }
    $fn = "imgs/".$a[0].".mp4";
    if (file_exists($fn)) {
        header("Location: $fn");
        die();
    }
}
?>
<body>
<h1>Hello World</h1>
</body>