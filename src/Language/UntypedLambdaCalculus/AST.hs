module Language.UntypedLambdaCalculus.AST where

import Data.Proxy

newtype Id = Id Int

data Phase = O | S | E | K | H

class HasPush (p :: Phase) (p' :: Phase)
instance HasPush 'S 'S
instance HasPush 'S 'E
instance HasPush 'S 'K
instance HasPush 'S 'H
instance HasPush 'E 'E
instance HasPush 'E 'K
instance HasPush 'E 'H
instance HasPush 'K 'K
instance HasPush 'K 'H
instance HasPush 'H 'H

class HasLam (p :: Phase) (p' :: Phase)
instance HasLam 'O 'O
instance HasPush p p' => HasLam p p'

class VarTerm (t :: Phase -> *) where
    var :: Id -> t p

class LamTerm (t :: Phase -> *) where
    lam :: HasLam p p' => Proxy p -> Id -> t p' -> t p'

class PushTerm (t :: Phase -> *) where
    push :: HasPush p p' => Proxy p -> t p' -> t p'

class ConnTerm (t :: Phase -> *) where
    conn :: t p -> t p -> t p

class AppTerm (t :: Phase -> *) where
    app :: t 'O -> t 'O -> t 'O
