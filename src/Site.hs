import Hakyll

import Site.Compilers
import Site.Config
import Site.Contexts
import Site.Routes
import Site.URLHelper

main :: IO ()
main = hakyllWith hakyllConfig $ do
    match "episodes/*" $ do
        route indexedEpisodeRoute
        compile $ pandocCompiler
            >>= saveSnapshot "content"
            >>= loadAndApplyTemplate "templates/episode.html" episodeCtx
            >>= loadAndApplyTemplate "templates/default.html" episodeCtx
            >>= replaceIndexLinks

    create ["index.html"] $ do
        route idRoute
        compile $ do
            episodes <- recentFirst =<< loadAll "episodes/*"
            let ctx = mainCtx episodes

            makeItem ""
                >>= loadAndApplyTemplate "templates/main.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= replaceIndexLinks

    create ["feed.xml"] $ do
        route idRoute
        compile $ do
            episodes <- recentFirst =<< loadAllSnapshots "episodes/*" "content"
            let ctx = feedCtx episodes

            makeItem ""
                >>= loadAndApplyTemplate "templates/feed.xml" ctx

    match "root/nojekyll" $ do
        route makeHidden
        compile copyFileCompiler

    match "css/*" $ do
        route cssRoute
        compile compressCssCompiler

    compileTemplates $
             "templates/*"
        .||. "partials/*"

    copyInPlace $
             "images/**"

    match "root/*" $ do
        route makeRoot
        compile copyFileCompiler
