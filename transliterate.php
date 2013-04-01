<?php

require_once(__DIR__ . '/functions.php');

$options = getopt("s:");
isset($options['s']) || die("Warning: attribute -s 'text' is required"  .PHP_EOL);

echo transliterate(isset($options['s']) ? $options['s'] : '');
