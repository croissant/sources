<?php

$limit = 10000;

$is_prime = function ($num) {
    $cnt = 0;
    for ($i = 1; $i <= $num; $i++) {
        if (($num % $i) == 0) {
            $cnt++;
        }
    }
    return $cnt == 2;
};

$result = 0;
for ($n = 2; $n <= $limit; $n++) {
    if ($is_prime($n)) {
        $result++;
    }
}

printf("%d", $result);
