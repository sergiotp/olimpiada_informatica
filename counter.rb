class FileReader
  def initialize file = 'presenca.txt'
    @reader = File.foreach(file)
  end

  def get_line
    @reader.next.to_i
  end
end

class Validator
  def initialize min_records = 1, max_records = 100_000, min_register = 0, max_register = 1_000_000
    @min_records = min_records
    @max_records = max_records
    @max_register = max_register
    @min_register = min_register
  end

  def validate_records value
    if value < @min_records || value > @max_records
      return false
    end
    return true
  end

  def validate_register value
    if value < @min_register || value > @max_register
      return false
    end
    return true
  end
end

class Counter
  def initialize file_reader = FileReader.new, validator = Validator.new
    @presence = []
    initialize_presence
    @file_reader = file_reader
    @validator = validator
  end

  def total_students
    total_lines = @file_reader.get_line
    exit(1) unless @validator.validate_records total_lines
    total_lines.times do
      value = @file_reader.get_line
      exit(1) unless @validator.validate_register value
      @presence[value] = 0b1
    end
    @presence.count(0b1)
  end

  private

  def initialize_presence
    1_000_000.times { |count| @presence[count] = 0b0 }
  end
end
