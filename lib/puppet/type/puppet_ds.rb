require 'puppet/resource_api'

Puppet::ResourceApi.register_type(
  name: 'puppet_ds',
  docs: <<-EOS,
      This type provides Puppet with the capabilities to manage ...
    EOS
  features: [],
  attributes:   {
    ensure:      {
      type:    'Enum[present, absent]',
      desc:    'Whether this resource should be present or absent on the target system.',
      default: 'present',
    },
    name:        {
      type:      'Enum["ds"]',
      desc:      'The name of the resource you want to manage.',
      behaviour: :namevar,

    },
    json_data:        {
      #canonicalize resource api.
      type:      'Hash',
      desc:      'The JSON value of the currrent rbac_api_v1_directory settings',
    },
  },
)
