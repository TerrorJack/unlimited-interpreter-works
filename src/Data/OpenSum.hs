module Data.OpenSum where

import Data.Dynamic

newtype Sum (l :: [*]) = Sum { unSum :: Dynamic }

class Member (l :: [*]) t
instance Member (t ': l) t
instance {-# OVERLAPPABLE #-} Member l t => Member (nt ': l) t

inj :: (Typeable t, Member l t) => t -> Sum l
inj = Sum . toDyn

prj :: (Typeable t, Member l t) => Sum l -> Maybe t
prj = fromDynamic . unSum
