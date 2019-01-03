credhub generate -t certificate \
  -n /concourse/main/gcp-lab01-cert \
  -c telmore.io \
  -a *.sys.lab01.telmore.io \
  -a *.apps.lab01.telmore.io \
  -a *.login.sys.lab01.telmore.io \
  -a *.uaa.sys.lab01.telmore.io \
  --self-sign

credhub generate -n /concourse/main/networking_cert \
                -t certificate \
                --self-sign \
                -c *.sys.lab01.telmore.io \
                -a *.sys.lab01.telmore.io \
                -a *.apps.lab01.telmore.io \
                -a *.login.sys.lab01.telmore.io \
                -a *.uaa.sys.lab01.telmore.io

credhub generate -n /concourse/main/uaa_cert \
                 -t certificate \
                 --self-sign \
                 -c *.login.sys.lab01.telmore.io \
                 -a *.login.sys.lab01.telmore.io