import os, memfiles

for param in commandLineParams():
  let file = memfiles.open(param)
  stdout.write(cast[cstring](file.mem))
