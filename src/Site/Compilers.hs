module Site.Compilers
    ( compileTemplates
    , copyInPlace
    ) where

import Hakyll

compileTemplates :: Pattern -> Rules ()
compileTemplates p = match p $ compile templateCompiler

copyInPlace :: Pattern -> Rules ()
copyInPlace p = match p $ do
    route idRoute
    compile copyFileCompiler
