import os, strutils

const blockSize = 8192

var buf: array[blockSize, char]

# Char counting is just bytes
for param in commandLineParams():
  let file = open(param)

  var chars, words, lines = 0

  while true:
    let read = file.readBuffer(buf.addr, blockSize)
    if read <= 0: break

    for c in buf[0 .. <read]:
      chars += 1
      if c == '\l' or c == ' ' or c == '\t':
        words += 1
      if c == '\l':
        lines += 1

  echo lines, " ", words, " ", chars, " ", param
