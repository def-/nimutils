import base64, strutils

const size = 8192

var
  read = size
  buf {.noinit.}: array[size, char]
  output: string

while read == size:
  read = stdin.readChars(buf, 0, size)
  stdout.write(encode(buf[0..read-1], newLine = "\l"))
