<?php

$client = new \GearmanClient();
$client->addServer('gearman');
$client->doBackground('echo', date('Y-m-d H:i:s'));

