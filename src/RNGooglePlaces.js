'use strict';

var rnxGooglePlaces = require("react-native-google-places");

exports._openAutocompleteModal = function(filterOptions){
    return function(success_callback){
        return function(error_callback){
            return function(){
                rnxGooglePlaces._openAutocompleteModal(filterOptions).then(function(resData){
                    success_callback(resData)();
                }).catch(function(error){
                    error_callback(error)();
                });
            };
        };
    };
};

exports._openPlacePickerModal = function(boundsOptions){
    return function(success_callback){
        return function(error_callback){
            return function(){
                rnxGooglePlaces._openPlacePickerModal(boundsOptions).then(function (resData){
                    success_callback (resData)();
                }).catch(function (error){
                    error_callback(error)();
                });
            };
        };
    };
};


exports._getAutocompletePredictions = function(queryOptions){
    return function(success_callback){
        return function(error_callback){
            return function(){
                rnxGooglePlaces._getAutocompletePredictions(queryOptions).then(function (resData){
                    success_callback (resData)();
                }).catch(function (error){
                    error_callback(error)();
                });
            };
        };
    };
};



exports._lookUpPlaceByID = function(placeID){
    return function(success_callback){
        return function(error_callback){
            return function(){
                rnxGooglePlaces._lookUpPlaceByID(placeID).then(function (resData){
                    success_callback(resData)();
                }).catch(function(error){
                    error_callback(error)();
                });
            };
        };
    };
};
