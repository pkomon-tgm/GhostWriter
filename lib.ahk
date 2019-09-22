
class CodeBlock {
	LineSeparator := "`n"
	Lines := []
	
	SendLines(line_sleep := 0) {
		for index in this.Lines {
			SendRaw % this.Lines[index] . this.LineSeparator
			if line_sleep {
				Sleep % line_sleep
			}
		}
	}
}

class Parser {
	Marker := "///!"

	__New(marker) {
		this.Marker := marker
	}

	Parse(filename) {
		file := FileOpen(filename, "r `n")
		if not file {
			return
		}
		
		result := {}
		block_name := ""
		
		while not file.AtEOF {
			line := file.ReadLine()
			line := Trim(line, "`n`r")
			if StrStartsWith(line, this.Marker) {
				new_block_name := SubStr(line, StrLen(this.Marker)+1)
				if StrLen(new_block_name) {
					block_name := new_block_name
					if not result.HasKey(block_name){
						result[block_name] := new CodeBlock()
					}
				} else {
					block_name := ""
				}
			} else {
				if StrLen(block_name) {
					result[block_name].Lines.Push(line)
				}
			}
		}
		return result
	}
}

StrStartsWith(str, with) {
	if StrLen(with) > StrLen(str)
		return 0
	return SubStr(str, 1, StrLen(with)) = with
}
