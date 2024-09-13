#include <SDL2/SDL.h>

#include <imgui.h>

int main(int argc, char **argv) {
  SDL_Init(SDL_INIT_VIDEO);
  auto window =
      SDL_CreateWindow("SDL2 Starter Project", SDL_WINDOWPOS_UNDEFINED,
                       SDL_WINDOWPOS_UNDEFINED, 640, 480, 0);
  return 0;
}
