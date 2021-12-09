The nordic Ota library is copied entirely, due to some modification required to force the update of the firmware during Driver OTA.
* Never overwrite those files unless you really know how to do that
During the driver update we basically need the Nordic library to just transfer the firmware file, the micro will handle the update by itself, by ignoring the jump to the bootloader.
In case of the BLE firmware the update will be entirely manged by the Nordic library.

DFUServiceSelector override init with a vorbose one
````
init(initiator: DFUServiceInitiator, controller: DFUServiceController, logger: LoggerHelper, peripheral: DFUStarterPeripheral) {
    self.initiator  = initiator
    self.logger     = logger
    self.controller = controller
    self.peripheral = peripheral

    self.peripheral.delegate = self
}
````
SecureDFUExecutor added initializer 
````
required init(_ initiator: DFUServiceInitiator, _ logger: LoggerHelper, _ peripheral: SecureDFUPeripheral) {
    self.initiator  = initiator
    self.logger     = logger
    self.firmware   = initiator.file!
    self.retryCount = MaxRetryCount
    self.peripheral = peripheral

}

required convenience init(_ initiator: DFUServiceInitiator, _ logger: LoggerHelper) {
    self.init(initiator, logger, SecureDFUPeripheral(initiator, logger))
}
````
SecureDFUExecutor
Modifed access to some properties
Modified initializer in DFU firmware to accept `s` file
