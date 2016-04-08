module Data.OpenSum where

import Data.Dynamic

newtype Sum l = Sum { unSum :: Dynamic }

class Member l t

inj :: (Typeable t, Member l t) => t -> Sum l
inj = Sum . toDyn

prj :: (Typeable t, Member l t) => Sum l -> Maybe t
prj = fromDynamic . unSum
