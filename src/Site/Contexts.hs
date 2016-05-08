module Site.Contexts
    ( episodeCtx
    , feedCtx
    , mainCtx
    ) where

import Hakyll

import Site.Constants

episodeCtx :: Context String
episodeCtx = mconcat
    [ dateField "date" "%b %d, %Y"
    , defaultContext
    ]

feedCtx :: [Item String] -> Context String
feedCtx episodes = mconcat
    [ listField "episodes" episodeCtx (return episodes)
    , constField "title" siteTitle
    , constField "root" siteHost
    , constField "description" podcastDescription
    , constField "subtitle" podcastSubtitle
    , constField "author" podcastAuthor
    , constField "owner" podcastAuthor
    , constField "email" podcastEmail
    , constField "coverArtURL" podcastCoverArtURL
    , constField "category" podcastCategory
    , constField "subCategory" podcastSubCategory
    , constField "explicit" podcastExplicit
    , dateField "date" "%a, %d %b %Y %H:%M:%S %z"
    , bodyField "description"
    , defaultContext
    ]

mainCtx :: [Item String] -> Context String
mainCtx episodes = mconcat
    [ listField "episodes" episodeCtx (return episodes)
    , constField "title" siteTitle
    , defaultContext
    ]
