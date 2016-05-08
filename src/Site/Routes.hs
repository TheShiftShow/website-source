module Site.Routes
    ( indexedEpisodeRoute
    , makeHidden
    , cssRoute
    , makeRoot
    ) where

import Hakyll
import System.FilePath
import Data.Monoid ((<>))

indexedEpisodeRoute :: Routes
indexedEpisodeRoute = customRoute $ \i ->
    let (_, name) = splitFileName $ toFilePath i
    in episodeNumber name </> "index.html"

  where
    episodeNumber = extractNumber . takeBaseName
    extractNumber = dropWhile (== '0') . take 4

cssRoute :: Routes
cssRoute = customRoute $ \i ->
    (flip replaceDirectory "css") $ (flip replaceExtension ".css") $ toFilePath i

makeHidden :: Routes
makeHidden = customRoute $ \i ->
    "." <> fileName i

makeRoot :: Routes
makeRoot = customRoute fileName

fileName :: Identifier -> FilePath
fileName = takeFileName . toFilePath
