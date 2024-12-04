import std/[re, strutils, sequtils]

let pattern = re"mul\((\d+),(\d+)\)"
let file = "day3_puzzle.txt"

let content: string = readFile(file)
let instances: seq[string] = findAll(content, pattern)

var s = 0
for item in instances:
    var x = item.replace(")", "").split('(')[1].split(',').map(parseInt)
    var y = x[0] * x[1]
    s += y

echo s

let do_dont_pattern = re"(do\(\))|(don't\(\))|(?:mul\((\d+),(\d+)\))"
let p2_instances = findAll(content, do_dont_pattern)

var do_mul = true
var count = 0
for i in p2_instances:
    if i == "do()":
        do_mul = true
    elif i == "don't()":
        do_mul = false
    elif do_mul and i.contains("mul"):
        var x = i.replace(")", "").split('(')[1].split(',').map(parseInt)
        var y = x[0] * x[1]
        count += y
        

echo count