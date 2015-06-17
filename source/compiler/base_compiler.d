module base_compiler;
import std.stdio;

import sass;
import less;
import coffee;
import babel;

void compile()
{

  // Compile coffee-script to js
  compileCoffee( "./assets/coffee/", "index-1");

  // Compile ES6 to js
  compileES6( "./assets/ES6/", "index-2");

  // Compile bootstrap sass and less css
  compileSass( "./assets/sass/", "bootstrap" );
  compileLess( "./assets/less/", "bootstrap" );

  // Compile index sass and less css
  compileSass( "./assets/sass/", "index-1" );
  compileSass( "./assets/sass/", "index-2" );
  compileLess( "./assets/less/", "index-1" );

}

