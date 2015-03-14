--- lib/posix/posix.nim.orig	2015-03-14 02:27:11.523449818 +0000
+++ lib/posix/posix.nim	2015-03-14 02:28:06.763453266 +0000
@@ -453,7 +453,7 @@
     l_linger*: cint ## Linger time, in seconds.
 
   TInPort* = int16 ## unsigned!
-  TInAddrScalar* = int32 ## unsigned!
+  TInAddrScalar* {.importc: "u_int32_t", header: "<sys/types.h>", final, pure.} = int32 ## unsigned!
 
   TInAddrT* {.importc: "in_addr_t", pure, final,
              header: "<netinet/in.h>".} = int32 ## unsigned!
