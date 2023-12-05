final: prev:

let

  patchIt = drv: inStr: outStr: drv.overrideAttrs (_: {
    patchPhase = ''
      substituteInPlace main.cpp \
        --replace '"${inStr}"' '"${outStr}"'
    '';
  });

in

{
  liba = patchIt prev.liba "a" "x";
  libc = patchIt prev.libc "C" "z";
  libd = patchIt prev.libd "d" "w";
  libb = patchIt prev.libb "b" "y";

  # Think about why...
  # - we don't need to touch myapp
  # - we don't need any override-nesting
}
