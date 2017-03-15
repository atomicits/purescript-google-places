module RNGooglePlaces where

import Prelude

import Control.Monad.Aff (Aff, attempt, makeAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Either (Either)
import Unsafe.Coerce (unsafeCoerce)

foreign import data FilterOptions :: *
foreign import data BoundOptions :: *
foreign import data Query :: *

filterType :: forall a. a -> FilterOptions
filterType = unsafeCoerce

boundType :: forall a. a -> BoundOptions
boundType = unsafeCoerce

queryType :: forall a. a -> Query
queryType = unsafeCoerce

newtype PlaceId = PlaceId String

foreign import _openAutocompleteModal ::
  forall e scallback ecallback. FilterOptions
  -> scallback
  -> ecallback
  -> Eff e Unit

foreign import _openPlacePickerModal ::
  forall e scallback ecallback. BoundOptions
  -> scallback
  -> ecallback
  -> Eff e Unit

foreign import _getAutocompletePredictions ::
  forall e scallback ecallback. Query
  -> scallback
  -> ecallback
  -> Eff e Unit

foreign import _lookUpPlaceByID ::
  forall e scallback ecallback. PlaceId
  -> scallback
  -> ecallback
  -> Eff e Unit

openautoCompleteModal :: forall a b. FilterOptions -> Aff b (Either Error a)
openautoCompleteModal opt = attempt $ makeAff (\error success -> _openAutocompleteModal opt success error)

openplacePickerModal :: forall a b. BoundOptions -> Aff b (Either Error a)
openplacePickerModal opt = attempt $ makeAff (\error success -> _openPlacePickerModal opt success error)

getautocompletePredictions :: forall a b. Query -> Aff b (Either Error a)
getautocompletePredictions opt = attempt $ makeAff (\error success -> _getAutocompletePredictions opt success error)

lookUpPlaceByID :: forall b. PlaceId -> Aff b (Either Error String)
lookUpPlaceByID opt = attempt $ makeAff (\error success -> _lookUpPlaceByID opt success error)
