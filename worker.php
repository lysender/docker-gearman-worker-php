<?php

$worker = new GearmanWorker();
$worker->addServer('gearman'); // gearman hostname is linked, required

$worker->addFunction('echo', 'doEcho');

while ($worker->work());

function doEcho($job) {
    // Can be viewed via the worker's supervisor logs
    echo "Workload: ".$job->workload()."\n";
}

