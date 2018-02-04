<?php

$limit = 10000;

$prime_list = function ($num) {
    $result = [];
    $list = range(2, $num);
    while (sqrt($num) > current($list)) {
        $current = array_shift($list);
        $result[] = $current;
        $list = array_filter($list, function ($v) use ($current) {
            return ($v % $current) > 0;
        });
    }
    return array_merge($result, $list);
};

printf("%d\n", sizeof($prime_list($limit)));