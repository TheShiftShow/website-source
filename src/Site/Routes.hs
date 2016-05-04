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
    let (path, name) = splitFileName $ toFilePath i
    in episodesPath path </> episodeName name </> "index.html"

  where
    episodesPath = flip replaceDirectory "episodes"
    episodeName = takeBaseName . dropDatePrefix
    dropDatePrefix = drop 11

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
