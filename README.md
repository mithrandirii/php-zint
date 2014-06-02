PHP bindings for the fabulous libzint

### Installation

    $ phpize
    $ ./configure
    $ make install

edit your php.ini and add:

    extension=zint.so

### Pre-requisites on all platforms:

 * you need libzint.so somewhere in your LD path (e.g. /usr/lib)
 * you need the zint.h in include path (e.g. /usr/include)
