<?php

class Set
{
    private $args = [];

    public function add(int ...$args): void
    {
        foreach ($args as $arg) {
            $this->args[$arg] = true;
        }
        ksort($this->args);
    }

    public function remove(int ...$args): void
    {
        foreach ($args as $arg) {
            if (isset($this->args[$arg])) {
                unset($this->args[$arg]);
            }
        }
    }

    public function exists(int ...$nums): Generator
    {
        foreach ($nums as $num) {
            yield isset($this->args[$num]);
        }
    }

    public function get(): array
    {
        return array_keys($this->args);
    }

    public function getLower(int $num): array
    {
        return array_filter($this->get(), function (int $v) use ($num) {
            return ($v <=> $num) == -1;
        });
    }

    public function getHeigher(int $num): array
    {
        return array_filter($this->get(), function (int $v) use ($num) {
            return ($v <=> $num) == 1;
        });
    }
}
    
$set = new Set();
$set->add(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,5);
var_dump($set->get());
foreach ($set->exists(1,2,3,10) as $r) {
    var_dump($r);
}
$set->remove(1,2,3,1,2,3);
$set->add(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,5);
var_dump($set->getLower(3));
var_dump($set->getHeigher(3));
