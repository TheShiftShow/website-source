module Site.Config where

import Hakyll
    ( Configuration
    , defaultConfiguration
    , providerDirectory
    )

hakyllConfig :: Configuration
hakyllConfig = defaultConfiguration {
    providerDirectory = "web"
}
