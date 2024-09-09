// RAII

#include <fstream>
#include <stdexcept>
#include <string>

class FileHandler {
public:
  FileHandler(const std::string &filename) {
    file.open(filename);
    if (!file.is_open()) {
      throw std::runtime_error("Filed to open file");
    }
  }

  ~FileHandler() {
    if (file.is_open()) {
      file.close();
    }
  }

  void write(const std::string &data) {
    if (file.is_open()) {
      file << data;
    }
  }

private:
  std::ofstream file;
};

int main() {
  FileHandler fh("test.txt");
	fh.write("Hi");

  return 0;
}
