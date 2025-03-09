cls

set project_name=crawler

odin strip-semicolon %project_name%
odin test %project_name%
odin run %project_name%