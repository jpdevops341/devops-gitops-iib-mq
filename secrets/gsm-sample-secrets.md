# 🔐 Google Secret Manager – Sample Secret List
These secrets are used to inject configuration and credentials into IBM MQ via the CSI driver.
| Secret Name         | Purpose                                 | File Name in Pod        |
|---------------------|------------------------------------------|--------------------------|
| mq-key-kdb          | TLS key database                         | key.kdb                  |
| mq-key-rdb          | TLS key stash                            | key.rdb                  |
| key.sth             | Stash password                           | key.sth                  |
| ltpa-keys           | Web console LTPA keys                    | ltpa.keys                |
| mqwebuser.xml       | MQ Web UI user config                    | mqwebuser.xml            |
| mqdevkeystore.jks   | Optional ACE keystore (if needed)        | mqdevkeystore.jks        |
| mqdevtruststore.jks | Optional ACE truststore (if needed)      | mqdevtruststore.jks      |
| DEV_SECRETS         | User/pass for MQ login (as key=value)    | credentials.env          |
