#include <boost/uuid/uuid_generators.hpp>
#include <iostream>
#include <string>

#include "raylib.h"
#include <entt/entt.hpp>

class GameObject {
private:
  boost::uuids::uuid id;

public:
  Transform transform;

  GameObject() { this->id = boost::uuids::random_generator()(); }
  ~GameObject() {}
};

class EntityManager {
private:
  entt::registry registry;

public:
	GameObject *CreateEntity() {
		return nullptr;
  }

  void DestroyEntity() {}

  void Update() {
    auto view = this->registry.view<const GameObject>();
    for (auto entity : view) {
      auto &go = view.get<GameObject>(entity);
      std::cout << "entt: go.transform.scale.x: " << go.transform.scale.x
                << std::endl;
      // ...
    }
  }
};

class Game {
private:
public:
  std::string window_title = "Snake";
  const int window_width = 800;
  const int window_height = 450;
  int fps = 60;

  EntityManager entity_manager;

  Game() {
    InitWindow(window_width, window_height, window_title.c_str());
    SetTargetFPS(fps);
  }
  ~Game() { CloseWindow(); }

  void update() {
    /*auto player = entity_manager.CreateEntity();*/

    while (!WindowShouldClose()) {

      // Update
      entity_manager.Update();

      // Draw
      BeginDrawing();
      ClearBackground(RAYWHITE);
      DrawText("Congrats! You created your first window!", 190, 200, 20,
               LIGHTGRAY);
      EndDrawing();
    }
  }
};

int main(void) {
  Game game;
  game.update();

  return 0;
}
