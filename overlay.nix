final: prev:

{
  liba = final.callPackage ./a { };
  libb = final.callPackage ./b { };
  libc = final.callPackage ./c { };
  libd = final.callPackage ./d { };
  myapp = final.callPackage ./app { };
}
