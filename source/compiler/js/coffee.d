
////////////////////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 2012 Christopher Nicholson-Sauls                                        //
//                                                                                        //
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this  //
//  software and associated documentation files (the "Software"), to deal in the          //
//  Software without restriction, including without limitation the rights to use, copy,   //
//  modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,   //
//  and to permit persons to whom the Software is furnished to do so, subject to the      //
//  following conditions:                                                                 //
//                                                                                        //
//  The above copyright notice and this permission notice shall be included in all        //
//  copies or substantial portions of the Software.                                       //
//                                                                                        //
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,   //
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A         //
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT    //
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF  //
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE  //
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                         //
////////////////////////////////////////////////////////////////////////////////////////////

module coffee;

import std.process;

import std.file : exists;

import vibe.core.log;

class CoffeeException : Exception {

  this ( string src ) {
    super( "Coffee: failed to compile " ~ src );
  }

}

void compileCoffee ( string dir, string target ) {

  // Make dest directory public/cjs/
  auto cjs = "./public/cjs/";
  auto src = dir ~ target;

  if( exists( src ~ ".coffee" ) )
    src ~= ".coffee";
  else
    src ~= ".coffee";

  logInfo( "Coffee: compiling %s -> %s", src, cjs );

  auto cmd = "coffee -o " ~ cjs  ~ " -c " ~ src;
  auto status = system( cmd );

  if ( status != 0 ) {
    throw new CoffeeException( src );
  }

}

