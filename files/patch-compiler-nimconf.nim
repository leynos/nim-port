--- compiler/nimconf.nim.orig	2014-11-23 15:24:36.000000000 +0000
+++ compiler/nimconf.nim	2015-03-13 23:21:20.638219323 +0000
@@ -214,21 +214,17 @@
   # try standard configuration file (installation did not distribute files
   # the UNIX way)
   let p = getPrefixDir()
-  result = joinPath([p, "config", filename])
-  when defined(unix):
-    if not existsFile(result): result = joinPath([p, "etc", filename])
-    if not existsFile(result): result = "/etc/" & filename
+  result = joinPath([p, "etc", filename])
+  if not existsFile(result): result = joinPath([p, "config", filename])
+  if not existsFile(result): result = "/etc/" & filename
 
 proc loadConfigs*(cfg: string) =
   # set default value (can be overwritten):
   if libpath == "": 
     # choose default libpath:
     var prefix = getPrefixDir()
-    when defined(posix):
-      if prefix == "/usr": libpath = "/usr/lib/nim"
-      elif prefix == "/usr/local": libpath = "/usr/local/lib/nim"
-      else: libpath = joinPath(prefix, "lib")
-    else: libpath = joinPath(prefix, "lib")
+    libpath = joinPath(prefix, "lib/nim")
+    if not ExistsDir(libpath): libpath = joinPath(prefix, "lib")
 
   if optSkipConfigFile notin gGlobalOptions:
     readConfigFile(getSystemConfigPath(cfg))
