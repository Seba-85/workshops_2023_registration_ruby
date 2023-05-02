# frozen_string_literal: true

class ValidatePassword
  def initialize(password)
    @password = password
  end

  def perform
    return false unless characters_in_range?

    return false unless uppercase_and_lowercase? && contains_numbers?

    return false unless contains_special_characters?

    return false if contains_repeating_characters?

    true
  end

  private

  attr_reader :password

  def characters_in_range?
    password.length.between?(6, 24)
  end

  def uppercase_and_lowercase?
    password.match?(/[A-Z]/) && password.match?(/[a-z]/)
  end

  def contains_numbers?
    password.match?(/\d/)
  end

  def contains_special_characters?
    password.match?(/[!@#$%&*+=:;?<>\[\]]/)
  end

  def contains_repeating_characters?
    password.match?(/(.)\1{2,}/)
  end
end
