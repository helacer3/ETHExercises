const { expect } = require("chai");

describe("Pokemon contract", function () {
    it("Pokemon Factory shouldn't pokemons", async function () {
        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");
        const hardhatPokemon = await PokemonFactory.deploy();
        const pokemons = await hardhatPokemon.getAllPokemons();
        expect(pokemons.length).to.equal(0);
    });

    it("Pokemon Factory create and Save two pokemons", async function () {
        const [owner] = await ethers.getSigners();
        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");
        const hardhatPokemon = await PokemonFactory.deploy();
        await hardhatPokemon.createPokemon('Pikachu', 1, [], [], []);
        await hardhatPokemon.createPokemon('Charizard', 2, [], [], []);
        const pokemons = await hardhatPokemon.getAllPokemons();
        expect(pokemons.length).to.equal(2);
    });
});