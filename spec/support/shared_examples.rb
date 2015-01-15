RSpec.shared_examples 'from_fixtures' do
  class << self
    def class_name_to_underscore(name)
      name.to_s.gsub(/([a-z])([A-Z])/) { $1 + '_' + $2.downcase }.downcase
    end

    def fixture_list(class_name)
      underscored_name = class_name_to_underscore(class_name.name)
      Dir["./spec/lib/#{underscored_name}/**.txt"]
    end

    def example_name_from_fixture_path(fixture)
      File.basename(fixture, '.txt')
    end
  end

  def read_fixture(path)
    content = File.read(path)
    content.split("---\n")
  end

  fixture_list(described_class).each do |fixture|
    it(example_name_from_fixture_path(fixture)) do
      input, output = read_fixture(fixture)

      sut = described_class.new(StringIO.new(input), StringIO.new)
      sut.solve

      sut.output.rewind
      result = sut.output.read
      expect(result).to eq(output)
    end
  end
end