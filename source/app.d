import base_vibe;
import base_initializer;
import base_router;
import base_compiler;

import base_proxy;

void main()
{

	// Reads configuration information from .toml files in config folder
	// look in ./source/initializer/base_initializer.d to see what gets read
	auto settings = base_initializer.http_read();

	// Converts specific assets to compiled versions in public folder
	// look in ./source/compiler/base_compiler.d to see what gets compiled
	base_compiler.compile();

	// Sets up routes that trigger controller actions per request
	auto router = base_router.build();

  base_proxy.test();

	// Call the listenHTTP function passing our settings
	// and the router object to map requests correctly
	listenHTTP(settings, router);

	// returns false if a help screen has been requested and displayed (--help)
	if (!finalizeCommandLineOptions())
		return;

	// Checks /etc/vibe/vibe.conf for settings
	// look at http://vibed.org/docs#privilege-lowering
	lowerPrivileges();

	// Run the vibe.d event loop
	runEventLoop();

}

