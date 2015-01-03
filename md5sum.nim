import os, memfiles, md5

var
  c: MD5Context
  d: MD5Digest

for param in commandLineParams():
  var
    file: TMemFile
    opened = true

  try:
    file = memfiles.open(param)
  except:
    opened = false

  c.md5Init()
  if opened:
    c.md5Update(cast[cstring](file.mem), file.size)
  c.md5Final(d)

  echo($d, "  ", param)
