import std/[strutils, tables, algorithm]

var file: string = "day1_puzzle.txt"


var left, right: seq[int] = @[]
for line in lines(file):
    var x = line.split("   ")
    left.add(parseInt(x[0]))
    right.add(parseInt(x[1]))

sort(left)
sort(right)

var distance: int
for i in countup(0, left.high):
  var diff = abs(left[i] - right[i])
  distance += diff

echo distance

var countTable = initTable[int, int]()
for i in right:
  if countTable.hasKey(i):
    countTable[i] += 1
  else:
    countTable[i] = 1 

var res = 0
for item in left:
  if countTable.hasKey(item):
    res += item * countTable[item]

echo res
