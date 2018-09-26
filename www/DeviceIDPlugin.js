var DeviceIDPlugin = {
	getUDID: function(successCallback){
        cordova.exec(successCallback, false, 'DeviceIDPlugin',
			'getUniqueIdentifier', []);
    }
};

module.exports = DeviceIDPlugin;