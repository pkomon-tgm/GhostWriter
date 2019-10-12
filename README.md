# GhostWriter
GhostWriter is an AutoHotKey script for parsing files and automatically typing out annotated sections of it.

## Intention
The primary use case of this project is to perfectly type out previously written source code (to be captured for video tutorials). 

## Usage example
1) Create annotated file (for example `test.txt`): 

```
This is not covered in any section.
#!sec1
Define sections using a prefix (in this case "#!"), later specified when parsing.
Also it may contain any <b>special</b> characters!
#!sec2
This is another section.
#!
Text after an empty section label also wont be included.
#!sec1
This will also be appended to sec1
```

2) Parse file using the `Parser` class (defined in `lib.ahk`). This returns a map of string (the defined section labels) to objects of class `CodeBlock` (defined in `lib.ahk`).

```
#Include ./lib.ahk
pars := new Parser("#!") ; specify string used as prefix
result := pars.Parse("test.txt")
```

3) Use `CodeBlock` objects to type out these sections.

```
  result.sec1.SendLines()
  Send, {Enter}
  result.sec2.SendLines()
```

Another, more realistic example can be seen in `test.ahk`.
