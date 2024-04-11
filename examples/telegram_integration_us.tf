terraform {
  # Require Terraform version 0.15.x (recommended)
  required_version = "~> 0.15.0"

  required_providers {
    site24x7 = {
      source = "site24x7/site24x7"
      # Update the latest version from https://registry.terraform.io/providers/site24x7/site24x7/latest

    }
  }
}

// Authentication API doc - https://www.site24x7.com/help/api/#authentication
provider "site24x7" {
  // (Security recommendation - It is always best practice to store your credentials in a Vault of your choice.)
  // (Required) The client ID will be looked up in the SITE24X7_OAUTH2_CLIENT_ID
  // environment variable if the attribute is empty or omitted.
  oauth2_client_id = "<SITE24X7_OAUTH2_CLIENT_ID>"

  // (Security recommendation - It is always best practice to store your credentials in a Vault of your choice.)
  // (Required) The client secret will be looked up in the SITE24X7_OAUTH2_CLIENT_SECRET
  // environment variable if the attribute is empty or omitted.
  oauth2_client_secret = "<SITE24X7_OAUTH2_CLIENT_SECRET>"

  // (Security recommendation - It is always best practice to store your credentials in a Vault of your choice.)
  // (Required) The refresh token will be looked up in the SITE24X7_OAUTH2_REFRESH_TOKEN
  // environment variable if the attribute is empty or omitted.
  oauth2_refresh_token = "<SITE24X7_OAUTH2_REFRESH_TOKEN>"

  // (Required) Specify the data center from which you have obtained your
  // OAuth client credentials and refresh token. It can be (US/EU/IN/AU/CN/JP/CA).
  data_center = "US"

  // (Optional) ZAAID of the customer under a MSP or BU
  zaaid = "1234"

  // (Optional) The minimum time to wait in seconds before retrying failed Site24x7 API requests.
  retry_min_wait = 1

  // (Optional) The maximum time to wait in seconds before retrying failed Site24x7 API
  // requests. This is the upper limit for the wait duration with exponential
  // backoff.
  retry_max_wait = 30

  // (Optional) Maximum number of Site24x7 API request retries to perform until giving up.
  max_retries = 4

}

// Telegram Integration API doc: https://www.site24x7.com/help/api/#create-telegram
resource "site24x7_telegram_integration" "telegram_integration_basic" {
  // (Required) Display name for the integration
  name = "Telegram Integration With Site24x7"
  // (Required) Web URL of your telegram channel to which the message will be posted.
  channel_url = "https://web.telegram.org/z/#-86576685"
  // (Required) Bot token created by botfather.
  token = "3468:zFiWfmzab-u-rom-TI8"
  // (Required) Title of the incident.
  title = "Website is Down"
}

// Telegram Integration API doc: https://www.site24x7.com/help/api/#create-telegram
resource "site24x7_telegram_integration" "telegram_integration" {
  // (Required) Display name for the integration
  name = "Telegram Integration With Site24x7"
  // (Required) Hook URL to which the message will be posted
  channel_url = "https://web.telegram.org/z/#-86576685"
  // (Required) Name of the comapny for Authentication.
  token = "3468:zFiWfmzab-u-rom-TI8"
  // (Optional) Resource Type associated with this integration. Default value is '0'. Can take values 0|1|2|3. '0' denotes 'All Monitors', '1' denotes 'Monitor Group', '2' denotes 'Monitors', '3' denotes 'Tags'
  // (Required) Title of the incident.
  title          = "Website is Down"
  selection_type = 0
  // (Optional) Setting this to 'true' will send alert notifications to this third-party integration when the monitor status changes to 'Trouble'. One among trouble_alert|critical_alert|down_alert should be set to true for receiving notifications. Default value is 'true'.
  trouble_alert = true
  // (Optional) Setting this to 'true' will send alert notifications to this third-party integration when the monitor status changes to 'Critical'. One among trouble_alert|critical_alert|down_alert should be set to true for receiving notifications.
  critical_alert = false
  // (Optional) Setting this to 'true' will send alert notifications to this third-party integration when the monitor status changes to 'Down'. One among trouble_alert|critical_alert|down_alert should be set to true for receiving notifications.
  down_alert = false
  // (Optional) Monitors to be associated with the integration when the selection_type = 2.
  monitors = ["756"]
  // (Optional) Tags to be associated with the integration when the selection_type = 3.
  tags = ["345"]
  // (Optional) List of tag IDs to be associated with the integration
  alert_tags_id = ["123"]
}
