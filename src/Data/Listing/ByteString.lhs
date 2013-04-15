Naren Sundar

\begin{code}

{-# LANGUAGE TypeFamilies #-}

module Data.Listing.ByteString
    (
    ) where

import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import Data.Int
import Data.Listing
import Data.Word

instance Listing B.ByteString where
    type Elem B.ByteString = Word8
    type Length B.ByteString = Int
    type Index B.ByteString = Int
    type IndexElem B.ByteString = Word8

    toList = B.unpack
    fromList = B.pack
    -- | no safe lookup for Text
    lookup t i = Just (B.index t i)
    (!) = B.index
    singleton = B.singleton
    size = B.length
    empty = B.empty
    null = B.null
    head = B.head
    tail = B.tail

instance Listing BL.ByteString where
    type Elem BL.ByteString = Word8
    type Length BL.ByteString = Int64
    type Index BL.ByteString = Int64
    type IndexElem BL.ByteString = Word8

    toList = BL.unpack
    fromList = BL.pack
    -- | no safe lookup for Text
    lookup t i = Just (BL.index t i)
    (!) = BL.index
    singleton = BL.singleton
    size = BL.length
    empty = BL.empty
    null = BL.null
    head = BL.head
    tail = BL.tail

\end{code}