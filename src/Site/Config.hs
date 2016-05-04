module Site.Config
    ( hakyllConfig
    ) where

import Hakyll
    ( Configuration
    , defaultConfiguration
    , providerDirectory
    )

hakyllConfig :: Configuration
hakyllConfig = defaultConfiguration {
    providerDirectory = "web"
}
