### FB8995024: NSPersistentCloudKitContainer.initializeCloudKitSchema() fails with "No authToken received for asset" with multiple asset-backed fields in public database

(Also raised [on the Apple Developer Forums](https://developer.apple.com/forums/thread/673124))

> When attempting to initialise the CloudKit schema for an NSPersistentCloudKitContainer-backed Core Data stack, the following error is thrown if any Core Data entities contain more than one String attribute and are in a persistent store whose databaseScope is .public:
> 
> ```
> 2021-02-07 17:06:01.693458+0000 NSPersistentCloudKitContainer+initTesting[15418:1560373] Fatal error: ###init() Error initialising CloudKit schema: Error Domain=NSCocoaErrorDomain Code=134060 "A Core Data error occurred." UserInfo={encounteredErrors=(
>     "<CKError 0x6000009c7c30: \"Partial Failure\" (2/1011); \"Failed to modify some records\"; partial errors: {\n\tCD_FAKE_Item_8BF758B9-D989-457C-81A4-F9EF845D22D7:(_defaultZone:__defaultOwner__) = <CKError 0x6000009aca50: \"Internal Error\" (1/1000); \"No authToken received for asset\">\n}>"
> )}: file NSPersistentCloudKitContainer_initTesting/NSPersistentCloudKitContainer_initTestingApp.swift, line 33
> ```
>
> This error can be consistently reproduced with the attached `NSPersistentCloudKitContainer+initTesting` Xcode project in Xcode 12.4 (12D4e) and running iOS 14.4 (18D46) in a simulator (logged in to iCloud, with a blank CloudKit container specified in as the target in Signing & Capabilities > iCloud > Containers.

---

> Nick Gillett from the Core Data team informed me that the workaround for this issue is to initialise against the private database. If that’s intended to remain the case, it would be useful for the documentation for NSPersistentCloudKitContainer.initializeCloudKitSchema() to describe this behaviour.