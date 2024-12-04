import std/[strutils, sequtils]

let f = "day2_puzzle.txt"

var report: seq[seq[int]] = @[]
for item in lines(f):
    var x = item.split(" ")
    report.add(x.map(parseInt))


proc checkSafe(line: seq[int]): bool = 
    if line[0] == line[1]:
        return false

    let direction = if line[0] < line[1]: 1 else: -1

    for i in countup(0, line.high-1):
        var diff = (line[i+1] - line[i]) * direction
        if diff <= 0 or diff > 3:
            return false
    
    return true

proc checkSafeDamper(line: seq[int]): bool = 
    if checkSafe(line): return true
    for i in countup(0, line.high):
        var newVals = line[0..<i] & line[i+1..^1]
        if checkSafe(newVals):
            return true
    return false

var count = 0
for r in report:
    if checkSafe(r):
        count += 1

echo count

var dcount = 0
for r in report:
    if checkSafeDamper(r):
        dcount += 1

echo dcount


