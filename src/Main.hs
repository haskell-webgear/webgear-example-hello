{-# LANGUAGE Arrows #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeApplications #-}

import Network.HTTP.Types (StdMethod (GET))
import qualified Network.HTTP.Types as HTTP
import Network.Wai.Handler.Warp (run)
import WebGear.Server

routes :: RequestHandler (ServerHandler IO) '[]
routes = [route| GET /hello/name:String/ |] $
  proc request -> do
    let name = pick @(PathVar "name" String) $ from request
    unlinkA <<< respondA HTTP.ok200 "text/plain" -< "Hello, " <> name

main :: IO ()
main = run 3000 (toApplication routes)
