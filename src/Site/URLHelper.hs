-- Shamelessly stolen from Pat Brisbin
-- https://github.com/pbrisbin/pbrisbin.com/blob/master/src/IndexedRoute.hs

module Site.URLHelper
    ( replaceIndexLinks
    ) where

import Hakyll

import qualified System.FilePath.Posix as P

-- | Replaces @href="/foo/index.html"@ with @href="/foo"@
replaceIndexLinks :: Item String -> Compiler (Item String)
replaceIndexLinks = replace "href=\"/[^\"]*/index.html" P.takeDirectory

replace :: String             -- ^ Regular expression to match
        -> (String -> String) -- ^ Provide replacement given match
        -> Item String
        -> Compiler (Item String)
replace p f = return . fmap (replaceAll p f)
