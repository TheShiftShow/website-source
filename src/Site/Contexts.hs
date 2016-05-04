module Site.Contexts
    ( episodeCtx
    , mainCtx
    ) where

import Hakyll

import Site.Constants

episodeCtx :: Context String
episodeCtx = mconcat
    [ dateField "date" "%b %d, %Y"
    , defaultContext
    ]

mainCtx :: [Item String] -> Context String
mainCtx episodes = mconcat
    [ listField "episodes" episodeCtx (return episodes)
    , constField "title" siteTitle
    , defaultContext
    ]
