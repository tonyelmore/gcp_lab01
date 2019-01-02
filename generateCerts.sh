credhub generate -t certificate \
  -n /concourse/main/gcp-lab01-cert \
  -c telmore.io \
  -a *.system.lab01.telmore.io \
  -a *.apps.lab01.telmore.io \
  -a *.login.system.lab01.telmore.io \
  -a *.uaa.system.lab01.telmore.io \
  --self-sign

credhub generate -n /concourse/main/networking_cert \
                -t certificate \
                --self-sign \
                -c *.system.lab01.telmore.io \
                -a *.system.lab01.telmore.io \
                -a *.apps.lab01.telmore.io \
                -a *.login.system.lab01.telmore.io \
                -a *.uaa.system.lab01.telmore.io

credhub generate -n /concourse/main/uaa_cert \
                 -t certificate \
                 --self-sign \
                 -c *.login.system.lab01.telmore.io \
                 -a *.login.system.lab01.telmore.io