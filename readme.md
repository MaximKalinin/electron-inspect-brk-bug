# Electron Inspect Brk Bug

This is a simple electron app that demonstrates a bug with starting electron
with the inspect flag. Specifically, `--inspect-brk` flag causes the app to
throw the following error:

```
Uncaught Exception:
ReferenceError: resolvedArgv is not defined
at Module._compile (node:internal/modules/cjs/loader:1562:20)
at Module._extensions..js (node:internal/modules/cjs/loader:1722:10)
at Module.load (node:internal/modules/cjs/loader:1296:32)
at Module._load (node:internal/modules/cjs/loader:1115:12)
at c._load (node:electron/js2c/node_init:2:18008)
at node:electron/js2c/browser_init:2:134881
at node:electron/js2c/browser_init:2:135090
at node:electron/js2c/browser_init:2:135094
at BuiltinModule.compileForInternalLoader (node:internal/bootstrap/realm:399:7)
at BuiltinModule.compileForPublicLoader (node:internal/bootstrap/realm:338:10)
```

## How to reproduce

Note: This repo is only meant to work on arm64 darwin system, but the package.sh
script can be easily modified to work on other systems following this guide:
https://www.electronjs.org/docs/latest/tutorial/application-distribution.

Clone the repo.

Run the following commands:

```
./package.sh # This will download the electron binary and package the app
./dist/Electron.app/Contents/MacOS/Electron --inspect-brk
```

Connect to the debugger.

Expected behavior:

The app starts and pauses JS execution.

Actual behavior:

The app starts, but does not stop and instead shows the error mentioned above.
