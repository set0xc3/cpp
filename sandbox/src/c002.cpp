// palindrome-number

#include <iostream>
#include <string>

class Solution {
public:
  bool isPalindrome(int x) {
    std::string str = std::to_string(x);
    int left = 0;
    int right = str.length() - 1;

    while (left < right) {
      if (str[left] != str[right]) {
        return false;
      }

      left += 1;
      right -= 1;
    }

    return true;
  }
};

int main() {
  Solution solution;
  std::cout << solution.isPalindrome(12321) << std::endl;

  return 0;
}
