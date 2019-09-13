# BEFORE RUNNING:
# ---------------
# 1. If not already done, enable the Cloud Resource Manager API
#    and check the quota for your project at
#    https://console.developers.google.com/apis/api/cloudresourcemanager
# 2. This sample uses Application Default Credentials for authentication.
#    If not already done, install the gcloud CLI from
#    https://cloud.google.com/sdk and run
#    `gcloud beta auth application-default login`.
#    For more information, see
#    https://developers.google.com/identity/protocols/application-default-credentials
# 3. Install the Ruby client library and Application Default Credentials
#    library by running `gem install google-api-client` and
#    `gem install googleauth`

require 'googleauth'
require 'google/apis/cloudresourcemanager_v1'

service = Google::Apis::CloudresourcemanagerV1::CloudResourceManagerService.new

service.authorization = \
    Google::Auth.get_application_default(['https://www.googleapis.com/auth/cloud-platform'])

projects = service.fetch_all(items: :projects) do |token|
  service.list_projects(page_token: token)
end

projects.each do |project|
  # TODO: Change code below to process each `project` resource:
  puts project.to_json
end
