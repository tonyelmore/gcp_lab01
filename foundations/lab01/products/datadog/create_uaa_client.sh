uaac client add datadog-firehose-nozzle \
    --name datadog-firehose-nozzle \
    --scope doppler.firehose,cloud_controller.admin_read_only,oauth.login \
    --authorities doppler.firehose,cloud_controller.admin_read_only,openid,oauth.approvals \
    --authorized_grant_types client_credentials,refresh_token \
    --access_token_validity 1209600 \
    -s $DATADOG_CLIENT_SECRET
