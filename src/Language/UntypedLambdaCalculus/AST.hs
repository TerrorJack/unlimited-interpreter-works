module Language.UntypedLambdaCalculus.AST where

type Id = Int

data Term
    = Var Id
    | Lam Id Term
    | App Term Term
