require 'spec_helper'
require 'puppet/type/pe_rbac_ds'

RSpec.describe 'the pe_rbac_ds type' do
  it 'loads' do
    expect(Puppet::Type.type(:pe_rbac_ds)).not_to be_nil
  end
end
