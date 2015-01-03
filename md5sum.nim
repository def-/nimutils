import os, md5

const
  blockSize = 8192

var
  file: File
  opened: bool
  c: MD5Context
  d: MD5Digest
  buf: array[blockSize, char]

for param in commandLineParams():
  opened = true
  try:
    file = open(param)
  except:
    opened = false

  c.md5Init()
  if opened:
    while true:
      let read = file.readBuffer(buf.addr, blockSize)
      if read <= 0: break
      c.md5Update(buf, read)
  c.md5Final(d)

  echo($d, "  ", param)
