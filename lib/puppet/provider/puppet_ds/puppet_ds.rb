require 'puppet/resource_api/simple_provider'
require 'puppet/provider/rbac_api_ds'

# Implementation for the puppet_ds type using the Resource API.
class Puppet::Provider::PuppetDs::PuppetDs < Puppet::ResourceApi::SimpleProvider
  def get(_context)
    context.notice("Getting '#{name}'")
    ds = Puppet::Provider::Rbac_api_ds::get_response("/#{name}").collect
    result = {}
    if ds == result
      result.add(:ensure, 'absent')
    else
      result.add(:ensure, 'present' )
    endpoint

    result.add('json_data', ds)
    #result.add('json_data', canonicalize(ds))
    result.add('name', 'ds')

      context.type.attributes.each do |attr_name, attr|
        result.add(attr_name, canonicalize(ds.get(attr_name)))
          #result[attr_name] = match(ds, attr, attr_name));
      end

    defined?(munge) ? munge(result) : result
      #return result;
  end

  def create(context, name, should)
    context.notice("Creating '#{name}' with #{should.inspect}")
  end

  def update(context, name, should)
    context.notice("Updating '#{name}' with #{should.inspect}")
  end

  def delete(context, name)
    context.notice("Deleting '#{name}'")
    Puppet::Provider::Rbac_api_ds::delete_response("/#{name}")
  end
end
