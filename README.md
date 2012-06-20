homebrew-formulas for the RSX robotics architecture
===================================================

This repository contains Homebrew formulas for the RSX integration architecture. 
Currently supported in Homebrew is the installation of the Robotics Service Bus as
the underlying communication framework.  

Please check http://code.cor-lab.org for more information.

How do I install RSB using these formula?
-----------------------------------------
Just `brew tap swrede/homebrew-formulas` and then `brew install <formula>`. For RSB:


    brew install rsb

If the formula conflicts with one from mxcl/master or another tap, you can `brew install swrede/homebrew-formulas/<formula>`.

You can also install via URL:


    brew install https://raw.github.com/swrede/homebrew-formulae/master/<formula>.rb


Docs
----
`brew help`, `man brew`, or the Homebrew [wiki](https://github.com/mxcl/homebrew/wiki).