
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

module less;

import std.process;

import std.file : exists;

import vibe.core.log;

class LessException : Exception {

  this ( string src ) {
    super( "Less: failed to compile " ~ src );
  }

}

void compileLess ( string dir, string target ) {

  // Make dest directory public/css/
  auto css = "./public/lcss/" ~ target ~ ".css";
  auto src = dir ~ target;

  if( exists( src ~ ".less" ) )
    src ~= ".less";
  else
    src ~= ".less";

  logInfo( "Less: compiling %s -> %s", src, css );

  auto cmd = "lessc --include-path=submodules/bootstrap-less/less/ " ~ src ~ " " ~ css;
  auto status = system( cmd );

  if ( status != 0 ) {
    throw new LessException( src );
  }

}

