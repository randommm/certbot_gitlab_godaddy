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
    acme_plus_subdomain="_acme-challenge"
else
    acme_plus_subdomain="_acme-challenge."${subdomain}
fi

#echo "domain registered: "$root_domain >> log
#echo "subdomain registered: "$subdomain >> log
#echo "acme challenge registered: "$acme_plus_subdomain >> log
#echo "validation: "$CERTBOT_VALIDATION >> log

curl -X PUT \
-H "Authorization: sso-key ${godaddy_key}:${godaddy_secret}" \
-H "Content-Type: application/json" -H "Accept: application/json" \
-d "[{\"data\":\"${CERTBOT_VALIDATION}\", \"ttl\": 600}]" \
"https://api.godaddy.com/v1/domains/${root_domain}/records/TXT/${acme_plus_subdomain}"

sleep 60
