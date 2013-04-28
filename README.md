iOS-RandomKeyGenerator
======================
1) Get the cryptopp repository (https://github.com/nileshkaria/cryptopp). This is the standard Crypto++ library (ver 5.6.2) which certain modifications in config.h for the Apple LLVM compiler.

2) Get the cryptopp static library which will be used in our iOS project. cd cryptopp/cryptopp562 ; make ; ls -alstr *.a 

3) Open the iOS-RandomKeyGenerator project in XCode. Add the static library to the project. NilPass -> Targets (NilPass) -> Build Phases -> Link Binary With Libraries -> Add libcryptopp.a
4) Go to the top of the project and create a new group called "Indexing Headers" and drag the headers from cryptopp/cryptopp562 to this group. IMPORTANT - DO NOT add to any targets when prompted.
5)  Make the following modifications under "Build Settings"
   - "Always search user paths" : Yes
   - "Skip Install" : Yes
   - "Installation Directory" : $(LOCAL_APPS_DIR)
   - "Scan All Source Files for Includes" : Yes
   - "Other Linker Flags" : -ObjC
   - "Library Search Paths" : $(inherited) 
                              $(SRCROOT)/../cryptopp
                              $(SRCROOT)/../cryptopp/cryptopp562
  - "C Language Dialect" : GNU99
  - "C++ Language Dialect" : GNU++11
  - "C++ Standard Library" : libstdc++ (GNU C++ standard library)
6) Rename the iOS .m file's extension in which you will use C++ to .mm
7) Include C++ headers as :
#ifdef __cplusplus
# include cplusplus_header.h
#endif
