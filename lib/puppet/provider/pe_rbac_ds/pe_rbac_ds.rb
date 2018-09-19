# Implementation for the pe_rbac_ds type using the Resource API.
require 'puppet/resource_api/simple_provider'
require 'puppet/provider/rbac_api_ds'
# require 'pry'
class Puppet::Provider::PeRbacDs::PeRbacDs < Puppet::ResourceApi::SimpleProvider
  #
  def get(context)
    context.notice("Getting '/ds' ")
    ds = Puppet::Provider::Rbac_api_ds.get_response('/ds').collect
    result = {}
    result[:ensure] = if ds.include?(:user_display_name_attr)
                        'present'
                      else
                        'abent'
                      end

    result[:json_data] = ds
    # result.add('json_data', canonicalize(ds))
    result[:name] = 'ds'

    # context.type.attributes.each do |attr_name, attr|
    #   result[attr_name] = canonicalize(ds.get(attr_name)))
    #     #result[attr_name] = match(ds, attr, attr_name));
    # end

    defined?(munge) ? munge(result) : result
    # return result;
  end

  def create(context, _name, should)
    context.notice("Creating '/ds' with #{should.inspect}")
  end

  def update(context, _name, should)
    context.notice("Updating '/ds' with #{should.inspect}")
  end

  def delete(context, _name)
    context.notice("Deleting '/ds' ")
    Puppet::Provider::Rbac_api_ds.delete_response('/ds')
  end
end
