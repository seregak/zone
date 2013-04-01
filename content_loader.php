<?php

require_once(__dir__ . '/functions.php');
require_once('/var/www/clipzone/configuration.php');

$cli_options = getopt("", array("src:"));
$src_path = isset($cli_options['src']) ? $cli_options['src'] : '';

//config
$allow_extensions = array("mp4");

$src_path || die("Error: --src option is empty" . PHP_EOL);
is_dir($src_path) || die("Error: --src is not a dir" . PHP_EOL);

if (($dh = opendir($src_path)) === false) {
	echo "Error: can't open dir" . PHP_EOL;
	exit();
}

($files = getFiles($dh, $src_path))
	|| die(@date("[Y-m-d H:i:s]: ") . "Files not found" . PHP_EOL);

$config = new JConfig();
mysql_connect($config->host, $config->user, $config->password)
	|| die(@date("[Y-m-d H:i:s]: ") . "Can't connect to DB" . PHP_EOL);
mysql_select_db($config->db)
	|| die(@date("[Y-m-d H:i:s]: ") . "Can't select DB" . PHP_EOL);
$pref = $config->dbprefix;
mysql_query("set names 'UTF8';");

$path_prefix = 'clips/';
foreach ($files as $cat => $subcats) {
	foreach ($subcats as $subcat => $files) {
		$db_cat = getCategoryByAlias($pref, $subcat, $cat."/");
		if ($db_cat) {
			foreach ($files as $file) {
				$name = getClearFilename($file, $allow_extensions);
				$trans_name = transliterate($name);
				$trans_filename = transliterate($file);
				$alias = formatAlias($trans_name);
				$tags = getTags($name);
				//echo "Add {$name}({$trans_name}, {$trans_filename})" . PHP_EOL;
				addMoview($pref, array(
					'cat_id' => $db_cat['id'],
					'cat' => $cat."/".$subcat,
					'name' => $name,
					'trans_name' => $trans_name,
					'trans_filename' => $trans_filename,
					'alias' => $alias,
					'tags' => $tags,
				));
				$paths[] = $src_path."/{$cat}/{$subcat}/{$file}";
			}
		} else {
			echo @date("[Y-m-d H:i:s]: ") . "Warning: Category {$cat} not found in DB" . PHP_EOL;
		}
	}
}

file_put_contents(__DIR__."/last_files.csv", implode(PHP_EOL, $paths).PHP_EOL);


@mysql_close();
