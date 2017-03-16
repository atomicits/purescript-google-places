'use strict';

var rnxGooglePlaces = require("react-native-google-places");

exports._openAutocompleteModal = function(filterOptions){
    return function(success_callback){
        return function(error_callback){
            return function(){
                rnxGooglePlaces.openAutocompleteModal(filterOptions).then(function(resData){
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
                rnxGooglePlaces.openPlacePickerModal(boundsOptions).then(function (resData){
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
                rnxGooglePlaces.getAutocompletePredictions(queryOptions).then(function (resData){
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
                rnxGooglePlaces.lookUpPlaceByID(placeID).then(function (resData){
                    success_callback(resData)();
                }).catch(function(error){
                    error_callback(error)();
                });
            };
        };
    };
};
