# frozen_string_literal: true

class CountElements
  def initialize(array)
    @array = array
  end

  def perform
    counts = Hash.new(0)

    @array.each do |element|
      counts[element] += 1
    end

    counts
  end
end
