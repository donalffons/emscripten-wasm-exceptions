#include <string>
#include <exception>
#include <emscripten/bind.h>
using namespace emscripten;
using namespace std;

class SomeException : public exception
{
public:
  SomeException(const string &msg) : _msg(msg){};

  virtual const char *what() const throw()
  {
    return _msg.c_str();
  }

  const string _msg;
};

string getExceptionMessage(intptr_t exceptionPtr)
{
  string m = reinterpret_cast<exception *>(exceptionPtr)->what();
  return m;
}

void throwSomething()
{
  throw(SomeException("Something went wrong"));
}

EMSCRIPTEN_BINDINGS(main)
{
  emscripten::function("throwSomething", &throwSomething);
  emscripten::function("getExceptionMessage", &getExceptionMessage);
}
