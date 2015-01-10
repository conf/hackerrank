RSpec.shared_examples 'in_out' do
  subject { described_class.new(StringIO.new(input), StringIO.new) }

  it do
    subject.solve
    subject.output.rewind

    result = subject.output.read.chop
    expect(result).to eq(output)
  end
end
