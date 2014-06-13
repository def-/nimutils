import os, strutils, memfiles

# Char counting is just bytes
for param in commandLineParams():
  let file = memfiles.open(param)

  var chars, words, lines = 0

  for c in cast[cstring](file.mem):
    chars += 1
    if c == '\l' or c == ' ' or c == '\t':
      words += 1
    if c == '\l':
      lines += 1

  echo lines, " ", words, " ", chars, " ", param
