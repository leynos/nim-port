--- build.sh.orig	2015-03-14 00:16:50.384988654 +0000
+++ build.sh	2015-03-14 00:17:21.909986500 +0000
@@ -26,10 +26,6 @@
   esac
 done
 
-CC="gcc"
-LINKER="gcc"
-COMP_FLAGS="-w -O3 -fno-strict-aliasing$extraBuildArgs"
-LINK_FLAGS=""
 # platform detection
 ucpu=`uname -m`
 uos=`uname`
