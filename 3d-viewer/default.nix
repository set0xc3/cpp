{
  pkgs ?
    import <nixpkgs> {
      overlays = [
        (final: prev: {
          imgui = prev.imgui.overrideAttrs (oldAttrs: {
						IMGUI_BUILD_SDL2_BINDING = true;
            IMGUI_BUILD_VULKAN_BINDING = true;
          });
        })
      ];
    },
}: let
  libs = with pkgs; [
  ];
in
  pkgs.mkShell {
    # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath libs}";

    VULKAN_VOLK_INCLUDE = "${pkgs.vulkan-volk}/include";
    VULKAN_VOLK_LIB = "${pkgs.vulkan-volk}/lib";
    SDL2_INCLUDE = "${pkgs.SDL2.dev}/include";
    SDL2_LIB = "${pkgs.SDL2}/lib";
    IMGUI_INCLUDE = "${pkgs.imgui}/include";
    IMGUI_LIB = "${pkgs.imgui.lib}/lib";

    packages = with pkgs; [
			vulkan-tools
			vulkan-loader
			vulkan-headers
			vulkan-tools-lunarg
			vulkan-extension-layer
			vulkan-memory-allocator
			vulkan-validation-layers
			vulkan-utility-libraries
			imgui
			SDL2
      bear
      catch2
      clang
    ];

    shellHook = ''
    '';
  }
