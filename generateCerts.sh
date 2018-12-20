credhub generate -t certificate \
  -n /concourse/main/gcp-lab01-cert \
  -c differentscale.com \
  -a *.system.lab01.differentscale.com \
  -a *.apps.lab01.differentscale.com \
  -a *.login.system.lab01.differentscale.com \
  -a *.uaa.system.lab01.differentscale.com \
  --self-sign