module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow.new(headers, row.chomp.split(', '))
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class CsvRow
  attr_accessor :headers, :csv_contents
  
  def initialize(headers = [], csv_contents=[])
    @headers = headers
    @csv_contents = csv_contents
  end

  def method_missing(name, *args)
    csv_contents[headers.index(name.to_s)]
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  include Enumerable
  acts_as_csv

  def each(&block)
    @csv_contents.each do |row|
      block.call(row)
    end
  end
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect

m.each {|row| puts row.first}