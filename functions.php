<?php

function transliterate($str) {
	$in = array(
		"а","б","в","г","д","е","з","и","й","к","л","м","н","о",
		"п","р","с","т","у","ф","х","ц","ы","А","Б","В","Г","Д",
		"Е","З","И","Й","К","Л","М","Н","О","П","Р","С","Т","У",
		"Ф","Х","Ц","Ы","ч","Ч","ш","Ш","ё","Ё","ж","Ж","щ","Щ",
		"э","Э","ю","Ю","я","Я","ъ","Ъ","ь","Ь",",","!"," ","'","&"
	);
	
	$out = array(
		"a","b","v","g","d","e","z","i","j","k","l","m","n","o",
		"p","r","s","t","u","f","h","c","y","A","B","V","G","D",
		"E","Z","I","J","K","L","M","N","O","P","R","S","T","U",
		"F","H","C","Y","ch", "Ch", "sh", "Sh", "jo", "Jo", "zh",
		"Zh", "sh", "Sh", "je", "Je", "ju", "Ju", "ja", "Ja", "",
		"", "", "", "", "", "_", "", "and"
	);

	return str_replace($in, $out, $str);
}

function formatAlias($translit) {
	return preg_replace("/\-+/i", "-",
		str_replace(array("_","."), array("-", ""),
			strtolower($translit)
		)
	);
}

function getFiles($dir_handler, $path) {
	global $allow_extensions;
	$allow_extensions_regexp = implode("|", $allow_extensions);
	$ret = array();
	while (($cat = readdir($dir_handler)) !== false) {
		$cat_dir_path = $path . DIRECTORY_SEPARATOR . $cat;
		if (!in_array($cat, array(".", "..")) && is_dir($cat_dir_path)) {
			$cat_handler = opendir($cat_dir_path);
			$tmp_ret = array();
			while (($subcat = readdir($cat_handler)) !== false) {
				$subcat_path = $cat_dir_path . DIRECTORY_SEPARATOR . $subcat;
				if (!in_array($subcat, array(".", "..")) && is_dir($subcat_path)) {
					$files = array();
					if (($local_handler = opendir($subcat_path)) !== false) {
						while (($file = readdir($local_handler)) !== false) {
							if (preg_match("/^.+\.({$allow_extensions_regexp})$/i", $file)) {
								$files[] = $file;
							}
						}
						closedir($local_handler);
					}
						
					if ($files) {
						$tmp_ret[$subcat] = $files;
					}
				}
			}
			closedir($cat_handler);
			
			if ($tmp_ret) {
				$ret[$cat] = $tmp_ret;
			}
		}
	}

	return $ret;
}

function getCategoryByAlias($prefix, $alias, $path_prefix = 'clips/') {
	$sql_sel = "select * from {$prefix}categories
		where alias='{$alias}' and path='{$path_prefix}{$alias}'";
	$q_sel = mysql_query($sql_sel);
	
	$ret = array();
	if (mysql_num_rows($q_sel)) {
		$ret = mysql_fetch_assoc($q_sel);
	}
	return $ret;
}

function getClearFilename($filename, $allow_ext = null) {
	$regexp_ext = is_null($allow_ext)
		? "\.[^\.]$"
		: "\." . implode("|", $allow_ext) . "$";
	
	return preg_replace("/{$regexp_ext}/i", "", $filename);
}

function getTags($title) {
	$tags = explode("-", $title);
	$tags[0] = trim($tags[0]);
	if (count($tags) > 1) {
		$tags = str_replace(
			array(
				"ft.", " feat ", "&", " and ",
				"Ft.", "FT.", "&", " AND ",
			),
			array(
				"", " ", "", " ",
				"", "", "", " ",
			),
			$tags[0]
		);
		$tags = preg_replace("/[ ]+/i", " ", $tags);
		$tags = explode(" ", $tags);
		$tags = implode(", ", $tags);
	} else {
		$tags = explode(" ", $tags[0]);
		$tags = $tags[0];
	}
	
	return $tags;
}

function addMoview($prefix, $options) {
	$asset_id = addAsset($prefix, $options);
	$sql_ins = "INSERT INTO `{$prefix}content` VALUES
		(NULL,{$asset_id},'".addslashes($options['name'])."','{$options['alias']}','',
		'".getIntroText($options)."','".getBody($options)."',
		1,0,0,{$options['cat_id']},
		-- created
		NOW() - INTERVAL 1 DAY,42,'',
		NOW() - INTERVAL 1 DAY,42,0,'0000-00-00 00:00:00',
		NOW() - INTERVAL 1 DAY,'0000-00-00 00:00:00',
		-- images
		'{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}',
		-- urls
		'{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}',
		-- attribs
		'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',
		2,0,3,'".addslashes($options['tags'])."','',1,
		-- hits
		0,
		'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',
		0,'*','');";
	//var_dump($sql_ins);
	$q_ins = mysql_query($sql_ins);
	$content_id = mysql_insert_id();
	var_dump($content_id, $asset_id);
	
	if ($content_id) {
		$q_upd = mysql_query("update `{$prefix}assets`
			set name=concat(name,'{$content_id}')
			where id={$asset_id}");
	}
	
	return $content_id;
}

function addAsset($prefix, $opt) {
	$sql_ins = "INSERT INTO `{$prefix}assets` VALUES
		(NULL,64,
		1086,1087,4,
		'com_content.article.',
		'{$opt['trans_name']}',
		'{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');";
	mysql_query($sql_ins);
	return mysql_insert_id();
}

function getIntroText($opt) {
	$ret = <<<HTML
<p><a href="{$opt['cat']}/{$opt['alias']}">
	<img class="size-auto" src="caver/{$opt['trans_name']}.jpg"
		title="Скачать клип - {$opt['name']}"
		alt="Клип скачать - {$opt['name']}"
		width="250" height="141" border="0" />
</a></p>
HTML;
	return addslashes($ret);
}

function getBody($opt) {
	$ret = <<<HTML
<p><br /> <strong>Смотреть клип онлайн</strong></p>
<p>
    <video width="640" height="360" poster="/caver/{$opt['trans_name']}.jpg"
			controls="controls" preload="yes" autoplay="autoplay">
        <source type="video/mp4" src="clip/{$opt['trans_filename']}" />
    </video>
</p>
<p><a href="clip/{$opt['trans_filename']}">Cкачать клип</a> - {$opt['name']}</p>
<p><br /> <strong>Прослушать в mp3</strong></p>
<p>
    <audio src="mp3/{$opt['trans_name']}.mp3" type="audio/mp3" class="/mp3">
    </audio>
</p>
<p><a href="mp3/{$opt['trans_name']}.mp3">Cкачать mp3</a> - {$opt['name']}</p>


<p><strong>Поделиться клипом:</strong></p>
<script type="text/javascript" src="//yandex.st/share/share.js"
charset="utf-8"></script>
<div class="yashare-auto-init" data-yashareL10n="ru"
 data-yashareType="none" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir,lj,gplus"
></div>
<br>

<p style="color:#a9a9a9">Вы можете скачать или посмотреть онлайн клип {$opt['name']}, а также видео клипы как русских так и зарубежных исполнителей.</p>
<p style="color:#a9a9a9">Скачать {$opt['name']} или смотреть клип {$opt['name']} онлайн.</p>

HTML;
	return addslashes($ret);
}
