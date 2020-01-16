
# puppet_ds

## Puppet Directory Service

The Puppet_ds module encapsulates usage of the rbac_api/v1/ds end point [https://puppet.com/docs/pe/2018.1/rbac_api_v1_directory.html#put-ds](https://puppet.com/docs/pe/2018.1/rbac_api_v1_directory.html#put-ds)for configuring usage of a Directory Service (DS) for Role Based Access and Control(RBAC) of the Puppet Console.

The v 0.1.0, version of this is Puppet Task based only.

### Table of Contents

- [puppet_ds](#puppetds)
  - [Puppet Directory Service](#puppet-directory-service)
    - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [What puppet_ds affects **OPTIONAL**](#what-puppetds-affects-optional)
    - [Setup Requirements **OPTIONAL**](#setup-requirements-optional)
    - [Beginning with puppet_ds](#beginning-with-puppetds)
  - [Usage](#usage)
  - [Limitations](#limitations)
  - [Development](#development)
    - [ToDo](#todo)
  - [Release Notes/Contributors/Etc. **Optional**](#release-notescontributorsetc-optional)

## Description

The module provides capabilities to use [<https://puppet.com/docs/pe/2018.1/rbac_api_v1_directory.html#put-ds]> (<https://puppet.com/docs/pe/2018.1/rbac_api_v1_directory.html#put-ds)> to get, set and test the directory services with a `Puppet Task` or by directly using the scripts provided as tasks during bootstrap and install of the Puppet Enterprise server.

## Setup

### What puppet_ds affects **OPTIONAL**

### Setup Requirements **OPTIONAL**

You will need a active and reachable Directory Service, the documentation and test data uses a publicly WWW hosted DS service.

You will need to install `Bolt` as part of your bootstrap stage or provide matching environment variables and execute the shell scripts directly.

### Beginning with puppet_ds

Review the data scheme of the DS json Puppet requires.

```json
 {"schema" : {
       "help_link" : [ "maybe", "Str" ],
       "ssl" : "Bool",
       "(optional-key :ssl_hostname_validation)" : [ "maybe", "Bool" ],
       "group_name_attr" : "Str",
       "password" : [ "maybe", "Str" ],
       "group_rdn" : [ "maybe", "Str" ],
       "connect_timeout" : [ "maybe", "Int" ],
       "(optional-key :start_tls)" : [ "maybe", "Bool" ],
       "user_display_name_attr" : "Str",
       "hostname" : "Str",
       "base_dn" : "Str",
       "user_lookup_attr" : "Str",
       "port" : "Int",
       "login" : [ "maybe", "Str" ],
       "group_lookup_attr" : "Str",
       "(optional-key :disable_ldap_matching_rule_in_chain)" : [ "maybe", "Bool" ],
       "group_member_attr" : "Str",
       "(optional-key :id)" : [ "eq", 1 ],
       "(optional-key :ssl_wildcard_validation)" : [ "maybe", "Bool" ],
       "user_email_attr" : "Str",
       "(optional-key :search_nested_groups)" : [ "maybe", "Bool" ],
       "user_rdn" : [ "maybe", "Str" ],
       "group_object_class" : [ "maybe", "Str" ],
       "display_name" : "Str",
       "(optional-key :type)" : [ "maybe", [ "enum", "activedirectory", "openldap", "apacheds" ] ]
     }
   }
```

## Usage

Currently the module only supports `Puppet Tasks` see <[https://puppet.com/docs/bolt/latest/bolt_running_tasks.html](https://puppet.com/docs/bolt/latest/bolt_running_tasks.html)> for more information on running the provided tasks.

## Limitations

The tasks provided will only work on a server configured as the Puppet Enterprise server or MOM.

## Development

Pull requests welcome.

### ToDo

- Create puppet_ds resources equivalent to all tasks.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
