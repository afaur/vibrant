module base_router;

import base_std;
import base_vibe;
import base_controller;

URLRouter build()
{
    // Create a router object
    auto router = new URLRouter;

    // Produce handlers for routes
    router.get(  "/users/:user", &user_controller.user_show    );
    router.post( "/adduser",     &user_controller.user_add     );
    router.get(  "*",            serveStaticFiles("./public/") );

    // Return router object
    return router;

}

