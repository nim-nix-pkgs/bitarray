{
  description = ''mmap-backed bitarray implementation in Nim.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-bitarray-v0_1_1.flake = false;
  inputs.src-bitarray-v0_1_1.owner = "onecodex";
  inputs.src-bitarray-v0_1_1.ref   = "v0_1_1";
  inputs.src-bitarray-v0_1_1.repo  = "nim-bitarray";
  inputs.src-bitarray-v0_1_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-bitarray-v0_1_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-bitarray-v0_1_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}