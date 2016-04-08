module Language.UntypedLambdaCalculus.AST where

import Data.OpenSum

type Id = Int

newtype Var = Var Id

data App = App Term Term

data Lam t t' = Lam Id t'

data Seq t = Seq t t

data Push t t' = Push t'

newtype Term = Term (forall l . (
    Member l Var,
    Member l App,
    Member l (Lam Term Term)
        ) => Sum l)

newtype TermS = TermS (forall l . (
    Member l Var,
    Member l (Seq TermS),
    Member l (Push TermS TermS),
    Member l (Lam TermS TermS)
        ) => Sum l)

newtype TermE = TermE (forall l . (
    Member l Var,
    Member l (Seq TermE),
    Member l (Push TermS TermE),
    Member l (Lam TermS TermE),
    Member l (Push TermE TermE),
    Member l (Lam TermE TermE)
        ) => Sum l)

newtype TermK = TermK (forall l . (
    Member l Var,
    Member l (Seq TermK),
    Member l (Push TermS TermK),
    Member l (Lam TermS TermK),
    Member l (Push TermE TermK),
    Member l (Lam TermE TermK),
    Member l (Push TermK TermK),
    Member l (Lam TermK TermK)
        ) => Sum l)

newtype TermH = TermH (forall l . (
    Member l Var,
    Member l (Seq TermH),
    Member l (Push TermS TermH),
    Member l (Lam TermS TermH),
    Member l (Push TermE TermH),
    Member l (Lam TermE TermH),
    Member l (Push TermK TermH),
    Member l (Lam TermK TermH),
    Member l (Push TermH TermH),
    Member l (Lam TermH TermH)
        ) => Sum l)
