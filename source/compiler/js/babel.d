
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

module babel;

import std.process;

import std.file : exists;

import vibe.core.log;

class ES6Exception : Exception {

  this ( string src ) {
    super( "Babel ES6: failed to compile " ~ src );
  }

}

void compileES6 ( string dir, string target ) {

  // Make dest directory public/ejs/
  auto ejs = "./public/ejs/main.js";
  auto src = dir ~ target;

  if( exists( src ~ ".ejs" ) )
    src ~= ".ejs";
  else
    src ~= ".ejs";

  logInfo( "Babel ES6: compiling %s -> %s", src, ejs );

  auto cmd = "babel " ~ src  ~ " -o " ~ ejs;
  auto status = system( cmd );

  if ( status != 0 ) {
    throw new ES6Exception( src );
  }

}
