{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE FlexibleContexts #-}

module Parser where

import Data.List
import Data.Maybe

import Text.Parsec

import Util

type Parser a = forall s st m. Stream s m Char => ParsecT s st m a

data Id = S String
              | I Integer
              | B Bool
              | V String
              | Comp [Id]
    deriving (Eq, Show)

data Expr = Expr Id
    deriving (Eq, Show)

data Constraint = Constraint [Id]
    deriving (Eq, Show)

data Def = Func Id Constraint Expr
    deriving (Eq, Show)

class PrettyPrint a where
    prettyPrint :: a -> String

maudeList :: [String] -> String
maudeList [] = "nil"
maudeList xs@(_:_) = unwords xs

instance PrettyPrint Id where
    prettyPrint (S str)      = "s(" ++ show str ++ ")"
    prettyPrint (I i)        = "i(" ++ show i ++ ")"
    prettyPrint (B b)        = "b(" ++ toLowerCase (show b) ++ ")"
    prettyPrint (V name)     = "v(" ++ show name ++ ")"
    prettyPrint (Comp parts) = "comp(" ++ maudeList (map prettyPrint parts) ++ ")"

instance PrettyPrint Expr where
    prettyPrint (Expr id) = "e(" ++ prettyPrint id ++ ")"

instance PrettyPrint Constraint where
    prettyPrint (Constraint ids) = "cs(" ++ maudeList (map (\id -> "c(" ++ prettyPrint id ++ ")") ids) ++ ")"

instance PrettyPrint Def where
    prettyPrint (Func id c e) = "def(f(" ++ prettyPrint id ++ "," ++ prettyPrint c ++ "," ++ prettyPrint e ++ "))"

parseFile :: String -> String -> IO ()
parseFile fname output = do
    contents <- readFile fname
    case parseDef contents of
        Left err -> error $ show err
        Right parsed ->
            writeFile output $ intercalate "\n" $ map prettyPrint parsed

parseDef :: String -> Either ParseError [Def]
parseDef = parse enkiDef ""

enkiDef :: Parser [Def]
enkiDef = many (try func)

func :: Parser Def
func = do
    id <- enkiId
    wsSkip
    string "is:"
    -- optional newlines
    wsSkip
    Constraint cs <- constraint
    wsSkip
    char '.'
    optional newlines

    pure $ Func id (Constraint (init cs)) (Expr (last cs))

expr :: Parser Expr
expr = Expr <$> enkiId

constraint :: Parser Constraint
constraint = Constraint <$> sepEndBy1 enkiId (wsSkip >> string "," >> wsSkip)

withWs :: Stream s m Char => ParsecT s st m a -> ParsecT s st m a
withWs parser = do
    a <- parser
    wsSkip
    pure a

enkiId :: Parser Id
enkiId = Comp <$> untilFail (choice (map (try . withWs) [var, bool, int, str, paren]))

untilFail :: Parser a -> Parser [a]
untilFail parser = do
    r <- optionMaybe parser
    case r of
        Nothing -> pure []
        Just v -> do
            rs <- untilFail parser
            pure $ v:rs

paren :: Parser Id
paren = between (string "(" >> wsSkip) (wsSkip >> string ")") enkiId

str :: Parser Id
str = S <$> (many1 (oneOf cs) >>= \m -> notFollowedBy (oneOf ":,()") >> pure m)
    where
        cs = ['a'..'z'] ++ ['+', '-', '=', '*', '/', '^']

var :: Parser Id
var = V <$> do
    s <- oneOf ['A'..'Z']
    ss <- many $ oneOf $ ['A'..'Z'] ++ ['a'..'z'] ++ ['0'..'9']

    pure $ s:ss

nonzeroDigit :: Parser Char
nonzeroDigit = oneOf "123456789"

int :: Parser Id
int = do
    neg <- optionMaybe $ try $ string "-"
    digits <- (:) <$> nonzeroDigit <*> many digit

    pure $ I $ read $ fromMaybe "" neg ++ digits

bool :: Parser Id
bool = B . read . titleCase <$> choice [string "true", string "false"]

wsSkip :: Parser ()
wsSkip = many (oneOf " \r\t") >> pure ()

wsSkip1 :: Parser ()
wsSkip1 = many1 (oneOf " \r\t") >> pure ()

whitespace :: Parser ()
whitespace = skipMany1 (oneOf " \t\n\r")

newlines :: Parser ()
newlines = many1 (wsSkip >> char '\n' >> wsSkip) >> pure ()

