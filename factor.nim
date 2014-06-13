import os, strutils

template divFactor(result, num, i: expr): stmt =
  while num mod i == 0:
    num = num div i
    result.add(i)

# Slow algorithm
proc factor(num: var int): seq[int] =
  result = @[]

  if num < 2:
    return

  result.divFactor(num, 2)

  var i = 3
  while i * i <= num:
    result.divFactor(num, i)
    i += 2

  if num > 1:
    result.add(num)

for param in commandLineParams():
  var num = parseInt(param)
  var str = $num & ":"
  for f in factor(num):
    str &= " " & $f
  echo str
