require 'spec_helper'

ensure_module_defined('Puppet::Provider::PeRbacDs')
require 'puppet/provider/pe_rbac_ds/pe_rbac_ds'

RSpec.describe Puppet::Provider::PeRbacDs::PeRbacDs do
  subject(:provider) { described_class.new }

  let(:context) { instance_double('Puppet::ResourceApi::BaseContext', 'context') }

  describe 'get(context)' do
    it 'gets the resource' do

    end
  end

  describe 'create(context, name, should)' do
    it 'creates the resource' do

    end
  end

  describe 'update(context, name, should)' do
    it 'updates the resource' do
    end
  end

  describe 'delete(context, name, should)' do
    it 'deletes the resource' do

    end
  end
  end
  subject(:provider) { described_class.new }

  let(:context) { instance_double('Puppet::ResourceApi::BaseContext', 'context') }

  describe 'get(context)' do
    it 'gets the resource' do

    end
  end

  describe 'create(context, name, should)' do
    it 'creates the resource' do

    end
  end

  describe 'update(context, name, should)' do
    it 'updates the resource' do
    end
  end

  describe 'delete(context, name, should)' do
    it 'deletes the resource' do

    end
  end
end
