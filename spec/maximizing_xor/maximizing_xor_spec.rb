require 'spec_helper'
require 'maximizing_xor/maximizing_xor'

describe MaximizingXor do
  context 'first' do
    let(:input) { %w(1 10).join("\n") }
    let(:output) { %w(15).join("\n") }

    it_behaves_like 'in_out'
  end

  context 'second' do
    let(:input) { %w(10 15).join("\n") }
    let(:output) { %w(7).join("\n") }

    it_behaves_like 'in_out'
  end

end