require 'spec_helper'

describe 'Suite' do

  class << self
    def task_files
      @task_files ||= Dir['./lib/*.rb'].sort
    end

    def class_from_file_name(file_name)
      basename = File.basename(file_name, '.rb')
      class_name = basename.gsub(/(?:^|_)([a-z])/) { $1.upcase }
      Object.const_get "Hackerrank::#{class_name}"
    end
  end

  task_files.each do |file|
    require file
    describe class_from_file_name(file) do
      it_behaves_like 'fixture'
    end
  end
end
