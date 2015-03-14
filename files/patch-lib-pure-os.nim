--- work/nim-0.10.2/lib/pure/os.nim.orig	2015-03-14 00:02:20.402048491 +0000
+++ work/nim-0.10.2/lib/pure/os.nim	2015-03-14 00:02:34.596048295 +0000
@@ -1785,8 +1785,7 @@
     result = getApplAux("/proc/" & $getpid() & "/path/a.out")
     if result.len == 0: result = getApplHeuristic()
   elif defined(freebsd):
-    result = getApplAux("/proc/" & $getpid() & "/file")
-    if result.len == 0: result = getApplHeuristic()
+    result = getApplHeuristic()
   elif defined(macosx):
     var size: cuint32
     getExecPath1(nil, size)
