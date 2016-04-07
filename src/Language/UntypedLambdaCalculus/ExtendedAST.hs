module Language.UntypedLambdaCalculus.ExtendedAST (
    module Language.UntypedLambdaCalculus.AST
) where

import Language.UntypedLambdaCalculus.AST

data TermS
    = VarS Id
    | SeqS TermS TermS
    | PushS TermS
    | LamS Id TermS

data TermE
    = VarE Id
    | SeqE TermE TermE
    | PushSE TermE
    | LamSE Id TermE
    | PushE TermE
    | LamE Id TermE

data TermK
    = VarK Id
    | SeqK TermK TermK
    | PushSK TermK
    | LamSK Id TermK
    | PushEK TermK
    | LamEK Id TermK
    | PushK TermK
    | LamK Id TermK

data TermH
    = VarH Id
    | SeqH TermH TermH
    | PushSH TermH
    | LamSH Id TermH
    | PushEH TermH
    | LamEH Id TermH
    | PushKH TermH
    | LamKH Id TermH
    | PushH TermH
    | LamH Id TermH
