class Pairs
  attr_reader :array_of_elf_pair_arrays

  def initialize(lines)
    @array_of_elf_pair_arrays = lines
      .map! { |line| line.chomp }
      .map! { |line| line.split(",") }
  end
end

class SectionAssignment

  def initialize(section_1, section_2)
    @section_1 = section_1.split("-")
    @section_2 = section_2.split("-")
    @first_array_of_numbers = (@section_1[0].to_i..@section_1[1].to_i).to_a
    @second_array_of_numbers = (@section_2[0].to_i..@section_2[1].to_i).to_a
  end

  def compare_lengths
    if @first_array_of_numbers.length < @second_array_of_numbers.length
      @shorter_section = @first_array_of_numbers
      @longer_section = @second_array_of_numbers
    else
      @shorter_section = @second_array_of_numbers
      @longer_section = @first_array_of_numbers
    end
  end

  def complete_overlap
    compare_lengths

    @shorter_section.each do |section|
      unless @longer_section.include?(section)
        return false
      end
    end
    return true
  end

  def any_overlap
    compare_lengths

    @shorter_section.each do |section|
      if @longer_section.include?(section)
        return true
      else
        next
      end
    end
    return false
  end
end

class Solution1
  def answer
    array_of_elf_pairs = Pairs.new(File.readlines("day_4/input.txt")).array_of_elf_pair_arrays
    array_of_elf_pairs.map!{ |pair| SectionAssignment.new(pair[0], pair[1]) }
    .filter { |section_assignment| section_assignment.complete_overlap }.length
  end
end

puts Solution1.new.answer

class Solution2
  def answer
    array_of_elf_pairs = Pairs.new(File.readlines("day_4/input.txt")).array_of_elf_pair_arrays
    array_of_elf_pairs.map!{ |pair| SectionAssignment.new(pair[0], pair[1]) }
    .filter { |section_assignment| section_assignment.any_overlap }.length
  end
end

puts Solution2.new.answer
