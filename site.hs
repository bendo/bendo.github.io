{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid ((<>))
import           Hakyll

main :: IO ()
main = hakyll $ do
    match ("assets/imgs/*" .||. "assets/pdf/*" .||. "assets/js/*" .||. "assets/fonts/*" .||. "assets/fonts/aws/*") $ do
        route   idRoute
        compile copyFileCompiler

    match "assets/css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "pages/*" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    tags <- buildTags "posts/*" (fromCapture "tags/*.html")

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags tags)
            >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags tags)
            >>= relativizeUrls

    match "pages/cheats/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/cheat.html"   (postCtxWithTags tags)
            >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags tags)
            >>= relativizeUrls

    create ["posts.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" (postCtxWithTags tags) (return posts) <>
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/posts.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    create ["cheats.html"] $ do
        route idRoute
        compile $ do
            cheats <- loadAll "pages/cheats/*"
            let cheatCtx =
                    listField "cheats" defaultContext (return cheats) <>
                    constField "show-title" "true" <>
                    constField "title" "Cheats" <>
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/cheats.html"  cheatCtx
                >>= loadAndApplyTemplate "templates/default.html" cheatCtx
                >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- fmap (take 7) . recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" (postCtxWithTags tags) (return posts) <>
                    field "tags" (\_ -> renderTagList tags) <>
                    constField "title" "Welcome!" <>
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

    tagsRules tags $ \tag pattern -> do
        let title = "Posts tagged \"" ++ tag ++ "\""
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll pattern
            let ctx = constField "title" title
                      <> listField "posts" (postCtxWithTags tags) (return posts)
                      <> defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/tag.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls

    match "404.html" $ do
        route idRoute
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" <>
    constField "show-title" "true" <>
    defaultContext

postCtxWithTags :: Tags -> Context String
postCtxWithTags tags = tagsField "tags" tags <> postCtx
