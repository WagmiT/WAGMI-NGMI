const fs = require("fs");

const wagmi = fs.readFileSync("./ngmi.csv", "utf-8").split("\r\n");

fs.writeFileSync("./distribution.json", JSON.stringify(wagmi, null, 4))
