limit = 10000

prime_list = function (num) {
    result = []
    list = Array.from(Array(num+1).keys())
    while (list[0] <= 1) { list.shift() }
    while (Math.sqrt(num) > list[0]) {
        current = list.shift()
        result.push(current)
        list = list.filter(function (v) { return (v % current) > 0 })
    }
    return result.concat(list)
}

console.log(prime_list(limit).length)
