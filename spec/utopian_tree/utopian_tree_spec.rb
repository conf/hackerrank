require 'spec_helper'
require 'utopian_tree/utopian_tree'

describe UtopianTree do
  context 'first' do
    let(:input) { %w(2 0 1).join("\n") }
    let(:output) { %w(1 2).join("\n") }

    it_behaves_like 'in_out'
  end

  context 'second' do
    let(:input) { %w(2 3 4).join("\n") }
    let(:output) { %w(6 7).join("\n") }

    it_behaves_like 'in_out'
  end

end