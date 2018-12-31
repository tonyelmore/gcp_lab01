credhub generate -t certificate \
  -n /concourse/main/gcp-lab01-cert \
  -c telmore.io \
  -a *.system.lab01.telmore.io \
  -a *.apps.lab01.telmore.io \
  -a *.login.system.lab01.telmore.io \
  -a *.uaa.system.lab01.telmore.io \
  --self-sign