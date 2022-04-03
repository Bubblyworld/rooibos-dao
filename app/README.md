This directory contains the front-end code for the RooibosDAO project. See the [parent readme](../README.md) for instructions on how to install everything.


## Available Scripts

See the [package.json](package.json) for the full list of available `npm` scripts.

### `npm run start`

Compiles and serves the app in development mode. Supports hot reloading, so any changes you make to the app will reflect immediately if they compile. Note that you will not be able to interact with any contracts unless you have deployed them to a local blockchain - see the [parent readme](../README.md) for details.

```sh
$ npm run start

Compiled successfully!

You can now view app in the browser.

  Local:            http://localhost:3000
  On Your Network:  http://10.0.0.12:3000

```

### `npm run test`

Runs the front-end tests in interactive watch mode.

```
$ npm run test

No tests found related to files changed since last commit.
Press `a` to run all tests, or run Jest with `--watchAll`.

Watch Usage
 › Press a to run all tests.
 › Press f to run only failed tests.
 › Press q to quit watch mode.
 › Press p to filter by a filename regex pattern.
 › Press t to filter by a test name regex pattern.
 › Press Enter to trigger a test run.
```

### `npm run build`

Compiles and builds a production version of the app to the `build/` folder. Currently optimises and minifies the resulting build.

```sh
$ npm run build

Creating an optimized production build...
Compiled successfully.

File sizes after gzip:

  739.11 KB (+5.13 KB)  build/static/js/2.ef8f9abe.chunk.js
  21.79 KB (+316 B)     build/static/js/main.637348db.chunk.js
  765 B                 build/static/js/runtime-main.daa81fa3.js
  333 B                 build/static/css/main.a9672cbc.chunk.css
```

## Notes for Development

The app was bootstrapped with [Create React App](https://github.com/facebook/create-react-app), which hides a lot of the development dependencies under `react-scripts`. If we need to customise some aspect of the build process later we can call `npm run eject` to unfold all of the development dependencies so that we can manage them ourselves. Let's avoid that for as long as possible.
