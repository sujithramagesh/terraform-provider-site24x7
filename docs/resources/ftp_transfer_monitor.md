---
layout: "site24x7"
page_title: "Site24x7: site24x7_ftp_transfer_monitor"
sidebar_current: "docs-site24x7-resource-ftp-transfer-monitor"
description: |-
  Create and manage a FTP Transfer monitor in Site24x7.
---

# Resource: site24x7\_ftp\_transfer\_monitor

Use this resource to create, update and delete a FTP Transfer monitor in Site24x7.

## Example Usage


```hcl

// Site24x7 FTP Transfer Monitor API doc - https://www.site24x7.com/help/api/#ftp-transfer
resource "site24x7_ftp_transfer_monitor" "ftp_transfer_monitor_basic" {
    // (Required) Display name for the monitor
    display_name = "FTP Transfer Monitor - Terraform"

    // (Required) Host name of the monitor
    host_name = "status_check"

    //(Optional)Protocol of the monitor
    //Values:"FTP","SMTP","FTPS-SSL","FTPS-TLS"
    //Default:"FTP"
    protocol="FTP"

    //(Optional)Whois Server Port.Default value is 21
    port=21

    // (Optional) Check interval for monitoring. Default: 5. See
    // https://www.site24x7.com/help/api/#check-interval for all supported
    // values.
    check_frequency = "5"

    // (Optional) Timeout for connecting to website. Range 1 - 45.
    timeout = 10

    // (Optional) Perform upload check or not. Default: true.
    check_upload = true

    // (Optional) Perform download check or not. Default: true.
    check_download = true

    // (Required) user name of the monitor
    user_name="sas"

    //(Optional)password of the monitor
    password="sas"

    // (Required) destination of the monitor
    destination="/home/sas/"
 
    // (Optional)Toggle button to perform automation or not
    perform_automation=true

    //(Optional)(String)
    //Location Profile to be associated with the monitor. If 
    // location_profile_id and location_profile_name are omitted,
    // the first profile returned by the /api/location_profiles endpoint
    // (https://www.site24x7.com/help/api/#list-of-all-location-profiles) will be
    // used.
    location_profile_id = "123"

    //(Optional)(String)
    //Name of the Location Profile that has to be associated with the monitor. 
    // Either specify location_profile_id or location_profile_name.
    // If location_profile_id and location_profile_name are omitted,
    // the first profile returned by the /api/location_profiles endpoint
    // (https://www.site24x7.com/help/api/#list-of-all-location-profiles) will be
    // used.
    location_profile_name = "North America"

    //(Optional)(List of String)
    //List of monitor group IDs to associate the monitor to.
    monitor_groups = [
      "123",
      "456"
    ]

    // (Optional) Credential Profile to associate the website with 
    credential_profile_id = "123"

    // (Optional)(List of String)
    // List of dependent resource IDs. Suppress alert  when dependent monitor(s) is down.
    dependency_resource_ids = [
        "123",
        "456"
      ]

    //(Optional)(String)
    //Threshold profile to be associated with the monitor. If
    // omitted, the first profile returned by the /api/threshold_profiles
    // endpoint for the HEARTBEAT monitor type (https://www.site24x7.com/help/api/#list-threshold-profiles) will
    // be used.
    threshold_profile_id = "456418000342341"

    //(Optional)(List of String)
    // List if tag IDs to be associated to the monitor.
    tag_ids = [
      "123",
    ]

    //(Optional)(List of String)
    // List of tag names to be associated to the monitor. Tag name matching works for both exact and 
    //  partial match. Either specify tag_ids or tag_names.
    tag_names = [
      "Terraform",
      "Server",
    ]

    // (Optional)(Map of String) Map of status to actions that should be performed on monitor
    // status changes. See
    // https://www.site24x7.com/help/api/#action-rule-constants for all available
    // status values.
    actions = {1=465545643755}

     //(Optional)(List of String)
    // List if user group IDs to be notified on down. 
    // Either specify user_group_ids or user_group_names. If omitted, the
    // first user group returned by the /api/user_groups endpoint
    // (https://www.site24x7.com/help/api/#list-of-all-user-groups) will be 
    //used.
    user_group_ids = [
      "123",
    ]

    //(Optional)(List of String)
    //  List if user group names to be notified on down. 
    // Either specify user_group_ids or user_group_names. If omitted, the
    // first user group returned by the /api/user_groups endpoint
    // (https://www.site24x7.com/help/api/#list-of-all-user-groups) will be used.
    user_group_names = [
      "Terraform",
      "Network",
      "Admin",
    ]

    // (Optional) Mandatory, if the user group ID is not given. On-Call Schedule ID of your choice.
    on_call_schedule_id = "3455"
    
    //(Optional)(String)
    //Notification profile to be associated with the monitor. If
    // omitted, the first profile returned by the /api/notification_profiles
    // endpoint (https://www.site24x7.com/help/api/#list-notification-profiles)
    // will be used.
    notification_profile_id = "123"

    //(Optional)(String)
    //Name of the notification profile that has to be associated with the monitor.
    // Profile name matching works for both exact and partial match.
    // Either specify notification_profile_id or notification_profile_name.
    // If notification_profile_id and notification_profile_name are omitted,
    // the first profile returned by the /api/notification_profiles endpoint
    // (https://www.site24x7.com/help/api/#list-notification-profiles) will be
    // used.
    notification_profile_name = "Terraform Profile"

    // (Optional)(List of String) List of Third Party Service IDs to be associated to the monitor.
    third_party_service_ids = [
      "4567"
    ]    
}

```
## Attributes Reference

### Required
* `display_name` (String) Display Name for the monitor.
* `hostname`  (String)Host or domain name for the monitor
* `username`    (String)username to access the file
* `destination` (String)Destination file path of the monitor
### Optional
* `id` (String) The ID of this resource.
* `type` (String) FTP
* `protocol`    (String) Protocol of the monitor FTP, SFTP,FTPS(Use SSL),FTPS(Use TLS)
* `port`  (Number) Port of the monitor
* `check_frequency` (String)The Endpoints are mentioned at this interval
* `timeout` (Number) timeout period of the monitor
* `check_upload` (Boolean) Denotes to upload a file to FTP server.
* `check_download` (Boolean) Denotes to download the file from FTP server.
* `password` (String) password to access the file
* `perform_automation` (Boolean) To perform automation or not
* `location_profile_id` (String) Location profile to be associated with the monitor.
* `location_profile_name` (String) Name of the location profile to be associated with the monitor.
* `monitor_groups` (List of String) List of monitor groups to which the monitor has to be associated.
* `credential_profile_id` (String)Credential Profile to associate the website with. Notes: If you're using Auth user and Auth password, you can't configure Credential Profile
* `dependency_resource_ids` (List) List of dependent resource IDs. Suppress alert when dependent monitor(s) is down.
* `threshold_profile_id` (String) Threshold profile associated with the monitor.
* `tag_ids` (List of String) List of tags IDs to be associated to the monitor. Either specify tag_ids or tag_names.
* `tag_names` (List of String) List of tag names to be associated to the monitor. Tag name matching works for both exact and partial match. Either specify tag_ids or tag_names.
* `actions` (Map of String) Action to be performed on monitor IT Automation templates. 
* `user_group_ids` (List of String) List of user groups to be notified when the monitor is down. Either specify user_group_ids or user_group_names. If omitted, the first user group returned by the /api/user_groups endpoint will be used.
* `user_group_names` (List of String) List of user group names to be notified when the monitor is down. Either specify user_group_ids or user_group_names. If omitted, the first user group returned by the /api/user_groups endpoint will be used.
* `on_call_schedule_id` (String) Mandatory, if the user group ID is not given. On-Call Schedule ID of your choice.
* `notification_profile_id` (String) Notification profile to be associated with the monitor. Either specify notification_profile_id or notification_profile_name. If notification_profile_id and notification_profile_name are omitted, the first profile returned by the /api/notification_profiles endpoint will be used.
* `notification_profile_name` (String) Name of the notification profile to be associated with the monitor. Profile name matching works for both exact and partial match.
* `third_party_service_ids` (List of String) List of Third Party Service IDs to be associated to the monitor.
Refer [API documentation](https://www.site24x7.com/help/api/) for more information about attributes.
