require 'puppet/resource_api/simple_provider'
require 'puppet/provider/rbac_api_ds'

# Implementation for the puppet_ds type using the Resource API.
class Puppet::Provider::PuppetDs::PuppetDs < Puppet::ResourceApi::SimpleProvider
  def get(_context)
    [
      {
        name: 'foo',
        ensure: 'present',
      },
      {
        name: 'bar',
        ensure: 'present',
      },
    ]
  end

  def create(context, name, should)
    context.notice("Creating '#{name}' with #{should.inspect}")
  end

  def update(context, name, should)
    context.notice("Updating '#{name}' with #{should.inspect}")
  end

  def delete(context, name)
    context.notice("Deleting '#{name}'")
    Puppet::Provider::Rbac_api_ds::delete_response("/ds")
  end
end
