contract("Test", accounts => {

  const names = [
    "BaselineEmpty",
    "Storage",
    "Keccak",
    "Immutable",
    "KeccakPlusImmutable",
  ];

  for (const name of names) {
    const C = artifacts.require(name);

    it(name, async function() {
      const c = await C.new();
      await c.getDomainSeparator();
    });
  }

});
