console.log("")

if (typeof window !== "undefined") {
  console.log("Starting in browser env")
} else {
  console.log("Starting in node env")

  require('browser-env')();
  global._ = require("lodash")
}
