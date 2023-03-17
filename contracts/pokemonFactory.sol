// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {

  struct Pokemon {
    uint id;
    string name;
    Skill[] pokemonSkills;
    Type[] pokemonTypes;
    Weaknesse[] pokemonWeakness;
  }

  struct Skill {
    string description;
    string name;
  }
  struct Type {
    string description;
    string name;
  }
  struct Weaknesse {
    string description;
    string name;
  }

    Pokemon[] private pokemons;
    Skill[] private skills;
    Type[] private types;
    Weaknesse[] private weaknesses;

    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) ownerPokemonCount;
    // mapping (uint => Skill) pokemonSkills;
    // mapping (uint => Type) pokemonTypes;
    // mapping (uint => Weaknesse) pokemonWeaknesses;

    function createPokemon (
        string memory _name,
        uint _id,
        Skill[] memory _pokemonSkills,
        Type[] memory _pokemonTypes,
        Weaknesse[] memory _pokemonWeakness
    ) public {
        require(_id > 0, "El codigo del nuevo pokemon, debe ser mayor a cero");
        require(bytes(_name).length > 2, "El nombre del nuevo pokemon, debe tener al menos 3 caracteres");
        Pokemon memory newPokemon = Pokemon(
            _id, _name, _pokemonSkills, _pokemonTypes, _pokemonWeakness
        );
        pokemons.push(newPokemon);
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(newPokemon);
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
      return pokemons;
    }


    function getResult() public pure returns(uint product, uint sum){
      uint a = 1; 
      uint b = 2;
      product = a * b;
      sum = a + b; 
    }

    function createSkill(string memory _name, string memory _description) public {
        Skill memory newSkill = Skill(_name, _description);
        skills.push(newSkill);
    }

    function createType(string memory _name, string memory _description) public {
        Type memory newType = Type(_name, _description);
        types.push(newType);
    }
    
    function createWeaknesse(string memory _name, string memory _description) public {
        Weaknesse memory newWeaknesse = Weaknesse(_name, _description);
        weaknesses.push(newWeaknesse);
    }

    

    event eventNewPokemon(Pokemon newPokemon);
}