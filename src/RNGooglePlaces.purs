module RNGooglePlaces where

import Prelude

import Control.Monad.Aff (Aff, attempt, makeAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Either (Either)


type FilterOptions =
  { type      :: String
  , country    :: String
  , latitude   :: Number
  , longitude  :: Number
  , radius     :: Number
  , useOverlay :: Number
  }

type BoundOptions =
  { latitude  :: Number
  , longitude :: Number
  , radius    :: Number
  }

type Query =
  { type      :: String
  , country    :: String
  , latitude   :: Number
  , longitude  :: Number
  , radius     :: Number
  }

newtype PlaceId = PlaceId  String

type ResponseModal  =
  { placeID     :: String
  , website     :: String
  , phoneNumber :: String
  , address     :: String
  , name        :: String
  , types       :: Array String
  , latitude    :: Number
  , longitude   :: Number
  }

type AutocompletePredictionsResponseModal = Array APResponseModal

type APResponseModal =
  { primaryText :: String
  , placeID :: String
  , secondaryText :: String
  , fullText :: String
  , types :: Array String
  }


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


openautoCompleteModal :: forall eff. FilterOptions -> Aff eff (Either Error ResponseModal)
openautoCompleteModal opt = attempt $ makeAff (\error success -> _openAutocompleteModal opt success error)

openplacePickerModal :: forall eff. BoundOptions -> Aff eff (Either Error ResponseModal)
openplacePickerModal opt = attempt $ makeAff (\error success -> _openPlacePickerModal opt success error)

getautocompletePredictions :: forall eff. Query -> Aff eff (Either Error AutocompletePredictionsResponseModal)
getautocompletePredictions opt = attempt $ makeAff (\error success -> _getAutocompletePredictions opt success error)

lookUpPlaceByID :: forall eff. PlaceId -> Aff eff (Either Error ResponseModal)
lookUpPlaceByID opt = attempt $ makeAff (\error success -> _lookUpPlaceByID  opt success error)
