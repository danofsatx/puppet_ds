#!/bin/sh
# Puppet Task Name: set_ds_data
# To test this and ldap connectivity you can use a public LDAP (http://techsmruti.com/online-ldap-test-server/ for example)
# This is where you put the shell code for your task.
#
# {
#     "base_dn": "ou=mathematicians,dc=example,dc=com",
#     "connect_timeout": 30,
#     "disable_ldap_matching_rule_in_chain": true,
#     "display_name": "ldap.forumsys.com",
#     "group_lookup_attr": "ou",
#     "group_member_attr": "member",
#     "group_name_attr": "name",
#     "group_object_class": "ou",
#     "group_rdn": null,
#     "help_link": "http://techsmruti.com/online-ldap-test-server/",
#     "hostname": "ldap.forumsys.com",
#     "login": "cn=read-only-admin,dc=example,dc=com",
#     "password": "password",
#     "port": 389,
#     "search_nested_groups": true,
#     "ssl": false,
#     "ssl_hostname_validation": true,
#     "ssl_wildcard_validation": false,
#     "start_tls": false,
#     "type": null,
#     "user_display_name_attr": "displayName",
#     "user_email_attr": "mail",
#     "user_lookup_attr": "uid",
#     "user_rdn": "uid"
# }
# You can write Puppet tasks in any language you want and it's easy to
# adapt an existing Python, PowerShell, Ruby, etc. script. Learn more at:
# https://puppet.com/docs/bolt/0.x/writing_tasks.html
#
# Learn more at: https://puppet.com/docs/bolt/0.x/writing_tasks.html#ariaid-title11
#

SET_SERVER=$(puppet agent --configprint server)
CONSOLE="${CONSOLE:-$SET_SERVER}"
GET_CERTNAME=$(puppet agent --configprint certname)
if [ $CONSOLE == $GET_CERTNAME ]
then
    curl -X PUT https://${CONSOLE}:4433/rbac-api/v1/ds \
    --cert /etc/puppetlabs/puppet/ssl/certs/${CONSOLE}.pem \
    --key /etc/puppetlabs/puppet/ssl/private_keys/${CONSOLE}.pem \
    --cacert /etc/puppetlabs/puppet/ssl/certs/ca.pem -H "Content-Type: application/json" \
    -d "{
          \"base_dn\": \"$PT_base_dn\",
          \"connect_timeout\": ${PT_connect_timeout},
          \"disable_ldap_matching_rule_in_chain\": ${PT_disable_ldap_matching_rule_in_chain},
          \"display_name\": \"${PT_display_name}\",
          \"group_lookup_attr\": \"${PT_group_lookup_attr}\",
          \"group_member_attr\": \"$PT_group_member_attr\",
          \"group_name_attr\": \"$PT_group_name_attr\",
          \"group_object_class\": \"${PT}\",
          \"group_rdn\": \"${PT_group_rdn}\",
          \"help_link\": \"${PT_help_link}\",
          \"hostname\": \"${PT_hostname}\",
          \"login\": \"${PT_login}\",
          \"password\": \"${PT_password}\",
          \"port\": ${PT_port},
          \"search_nested_groups\": ${PT_search_nested_groups},
          \"ssl\": ${PT_ssl},
          \"ssl_hostname_validation\": ${PT_ssl_hostname_validation},
          \"ssl_wildcard_validation\": ${PT_ssl_wildcard_validation},
          \"start_tls\": ${start_tls},
          \"type\": ${PT_type},
          \"user_display_name_attr\": \"${PT_user_display_name_attr}\",
          \"user_email_attr\": \"${PT_user_email_attr}\",
          \"user_lookup_attr\": \"${PT_user_lookup_attr}\",
          \"user_rdn\": \"${PT_user_rdn}\"
        }"
else
  echo "This task is only valid to execute on ${SET_SERVER}"
fi
