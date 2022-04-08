<?php

require 'vendor/autoload.php';

$image = \Jcupitt\Vips\Image::newFromArray([[1],[2],[3]], 8);

var_dump($image);

// phpinfo();