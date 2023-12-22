{ pkgs ?  import <nixpkgs> {}, fwversion ? null }:

let
  firmware = import ../src {};
  config = ./.;

  glove80_left  = firmware.zmk.override { board = "glove80_lh"; keymap = "${config}/glove80.keymap"; kconfig = "${config}/glove80.conf"; inherit fwversion; };
  glove80_right = firmware.zmk.override { board = "glove80_rh"; keymap = "${config}/glove80.keymap"; kconfig = "${config}/glove80.conf"; inherit fwversion; };

in firmware.combine_uf2 glove80_left glove80_right
