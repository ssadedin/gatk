gatk
====

This repository is forked from the pre-2.4 version of GATK Lite that was licensed 
under MIT license, ported to work with JDK 1.8.

Unfortunately the original code would not compile under JDK1.8. However if compiled with JDK 1.7 it 
will fail at runtime with the the following error if run with JDK 1.8: 

```
java.lang.ExceptionInInitializerError
        at org.broadinstitute.sting.gatk.GenomeAnalysisEngine.<init>(GenomeAnalysisEngine.java:160)
        at org.broadinstitute.sting.gatk.CommandLineExecutable.<init>(CommandLineExecutable.java:53)
        at org.broadinstitute.sting.gatk.CommandLineGATK.<init>(CommandLineGATK.java:54)
        at org.broadinstitute.sting.gatk.CommandLineGATK.main(CommandLineGATK.java:90)
Caused by: java.lang.NullPointerException
        at org.reflections.Reflections.scan(Reflections.java:220)
        at org.reflections.Reflections.scan(Reflections.java:166)
        at org.reflections.Reflections.<init>(Reflections.java:94)
        at org.broadinstitute.sting.utils.classloader.PluginManager.<clinit>(PluginManager.java:77)
```

This means that the original 2.3.9 version of GATK can not be used with JDK 1.8.
For people dependent on the open source version this leaves us in a difficult position
if we cannot adopt the proprietary version as we are left on an unsupported version of Java.
Although newer versions have been open sourced, some of the original tools are not included
in GATK 4.0.

To solve this, this repository contains commits to solve the JDK 1.8 compile issues as
well as a script to create a cross-compiled binary that works under either 1.8 or 1.7.

Just clone the repository, install `ant` and run:

```
./build_fat_jar.sh
```

The script should build a jar file in the `fat` directory.
