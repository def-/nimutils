import os, memfiles, md5

# working with
# dd if=/dev/urandom of=tmp bs=1k count=250k
# not working with
# dd if=/dev/urandom of=tmp bs=1k count=290k
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

  echo file.size
  c.md5Init()
  if opened:
    c.md5Update(cast[cstring](file.mem), file.size)
  c.md5Final(d)

  echo($d, " ", param)
