RecuriveJSONDirectoryPrint
==========================

A BASH script which recursively searches for markdown files in a directory and outputs the results to a JSON file.

Since JS doesn't have access to the local file system I needed a way to quickly index a directory. The script is functional, but I would consider it a work in progress.

#####Example Output
```
{
  "propulsion":
  [
    "warp-drive.md",
    "impulse-drive.md"
  ],
  "weapons":
  [
    "phaser-arrays.md",
    "torpedo-launchers.md"
  ],
  "tranporters":
  [
    "personnel.md",
    "emergency.md",
    "cargo-bay.md"
  ]
  "computer":
  [
    "lcars-interface.md",
    "bio-neural-circuitry.md",
    "emergency-medical-hologram.md"
  ]
}
```

