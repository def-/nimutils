import os, md5

const
  blockSize = 8192

var
  file: File
  opened: bool
  c: MD5Context
  d: MD5Digest
  buf: array[blockSize, char]
  read: int

for param in commandLineParams():
  opened = true
  try:
    file = open(param)
  except:
    opened = false

  c.md5Init()
  if opened:
    read = 1
    while read > 0:
      read = file.readBuffer(buf.addr, blockSize)
      c.md5Update(buf, read)
  c.md5Final(d)

  echo($d, "  ", param)
