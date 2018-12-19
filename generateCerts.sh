credhub generate -t certificate \
  -n /concourse/main/gcp-lab01-cert \
  -c differentscale.com \
  -a *.system.gcplab01.differentscale.com \
  -a *.apps.gcplab01.differentscale.com \
  -a *.login.system.gcplab01.differentscale.com \
  -a *.uaa.system.gcplab01.differentscale.com \
  --self-sign