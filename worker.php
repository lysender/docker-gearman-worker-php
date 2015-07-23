<?php

$worker = new GearmanWorker();
$worker->addServer('gearman'); // gearman hostname is linked, required

$worker->addFunction('logit', 'do_logit');

while ($worker->work());

function do_logit($job) {
    file_put_contents('/tmp/logit.log', $job->workload()."\n", FILE_APPEND);
}

