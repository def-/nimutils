import os

const blockSize = 8192

var buf: array[blockSize, char]

for param in commandLineParams():
  let file = open(param)
  while true:
    let read = file.readBuffer(buf.addr, blockSize)
    if read <= 0: break
    discard stdout.writeChars(buf, 0, read)
