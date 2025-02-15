// colors_test.cpp

#undef NDEBUG

#include "common.hpp"
using namespace Common_sp;

#include "common.inc"



namespace
{
  
  
  
struct ThisApplication : Application
{
  ThisApplication ()
    : Application ("Test colors")
  	{
  	  addPositional ("go", "Argument");
  	}
  


 	void body () const final
	{
	  for (const Color::Type t : { Color::black
	                             , Color::red
	                             , Color::green
	                             , Color::yellow
	                             , Color::blue
	                             , Color::magenta
	                             , Color::cyan
	                             , Color::white
	                             }
	      )
	    for (const bool bright : {false, true})
	    {
	      const OColor c (cout, t, bright, true);
	      cout << "Color " << t << ' ' << (bright ? "bright" : "dark") << endl;
	    }
	}
};



}  // namespace




int main (int argc, 
          const char* argv[])
{
  ThisApplication app;
  return app. run (argc, argv);
}


