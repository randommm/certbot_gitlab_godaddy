#!/bin/bash

#Copyright 2018 Marco Inacio <m@marcoinacio.com>

#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at

#  http://www.apache.org/licenses/LICENSE-2.0

#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

source $config

if [ "x${subdomain}" = "x" ]; then
    full_domain=${root_domain}
else
    full_domain=${subdomain}"."${root_domain}
fi

privkey="${HOME}/.config/certbot/conf/live/${full_domain}/privkey.pem"
fullchain="${HOME}/.config/certbot/conf/live/${full_domain}/fullchain.pem"

echo "Installing:"
echo ${privkey}
echo ${fullchain}
echo "on"
echo $full_domain

curl --request POST \
--header "PRIVATE-TOKEN: ${gitlab_personal_acess_token}" \
-F "domain=${full_domain}" \
-F "certificate=@${fullchain}" \
-F "key=@${privkey}" \
https://gitlab.com/api/v4/projects/${gitlab_project_id}/pages/domains

echo ""

curl --request PUT \
--header "PRIVATE-TOKEN: ${gitlab_personal_acess_token}" \
-F "certificate=@${fullchain}" \
-F "key=@${privkey}" \
https://gitlab.com/api/v4/projects/${gitlab_project_id}/pages/domains/${full_domain}

echo ""
