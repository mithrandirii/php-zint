PHP_ARG_ENABLE(zint, for libzint support,
[ --enable-zint   Enable libzint support])
 
if test "$PHP_ZINT" = "yes"; then
    for i in $PHP_ZINT /usr /usr/local; do
        if test -f $i/include/zint.h; then
            ZINT_LIB_DIR=$i/lib
            ZINT_INC_DIR=$i/include
            AC_MSG_RESULT([found in $i]) 
        fi
    done
    
    if test -z "$ZINT_LIB_DIR" -o -z "$ZINT_INC_DIR"; then
        AC_MSG_RESULT([not found])
        AC_MSG_ERROR([Please install libzint found in zint package])
    fi
    
    PHP_CHECK_LIBRARY(zint, ZBarcode_Render, 
        [
        PHP_ADD_LIBRARY_WITH_PATH(zint, $ZINT_LIB_DIR, ZINT_SHARED_LIBADD)
        AC_DEFINE(HAVE_ZINT, 1, [libzint passed])
        ],
        [AC_MSG_ERROR([libzint version 2.4 or later required])],
        [-L$ZINT_LIB_DIR -R$ZINT_LIB_DIR])
    
    PHP_SUBST(ZINT_SHARED_LIBADD)
    PHP_ADD_INCLUDE($ZINT_INC_DIR)
    PHP_NEW_EXTENSION(zint, zint.c, $ext_shared)
fi
