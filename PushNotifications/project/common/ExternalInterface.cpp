#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"


using namespace pushnotifications;

value *callback_function = NULL;

static void pushnotifications_gettoken ()
{
	GetDeviceToken();
}
DEFINE_PRIM (pushnotifications_gettoken, 0);

//TODO-callback
static void pushnotifications_setcallback(value f)
{
    if(callback_function == NULL)
    {
        callback_function = alloc_root();
    }
    *callback_function = f;

    val_call1(*callback_function, alloc_string("HEEEEY"));

}
DEFINE_PRIM (pushnotifications_setcallback, 1);



extern "C" void pushnotifications_main () {

	val_int(0); // Fix Neko init

}
DEFINE_ENTRY_POINT (pushnotifications_main);
extern "C" int pushnotifications_register_prims () { return 0; }

