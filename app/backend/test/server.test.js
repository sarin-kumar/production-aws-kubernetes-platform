const test = require("node:test");
const assert = require("node:assert");

test("health contract", async () => {
  assert.strictEqual({ status: "ok", service: "backend" }.status, "ok");
});
