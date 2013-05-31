RecuriveJSONDirectoryPrint
==========================

A BASH script which recursively lists .MD files from a directory into an associative JSON array which is saved to a flat file.

Since JS doesn't have access to the local file system I needed a way to quickly index a directory. This script outputs

```
{"Docs:":[
  {"docs/DirOne": [
    { "asdasd.md"},
    { "asdasdas.md"},
  ]},
  {"docs/DirTwo": [
    { "bfbfbfb.md"},
    { "bgfbfbf.md"},
    ]}
]}
```

This script is fairly coupled to the the problem I was trying to solve, however it should be fairly easy to modify for other purposes. I'll get around to updating it when I have time.

#####Todo
- 
