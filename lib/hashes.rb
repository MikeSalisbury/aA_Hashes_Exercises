# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  result_hash = Hash.new(0)
  str.split.each do |word|
    result_hash[word] = word.length
  end
  result_hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.each do |k, v|
    if v == hash.values.sort[-1]
      return k
    end
  end
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k, v|
    older[k] = v
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  letters_hash = Hash.new(0)
  word.chars do |l|
    letters_hash[l] += 1
  end
  letters_hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  result_hash = Hash.new(0)
  arr.each do |el|
    result_hash[el] += 1
  end
  result_hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  result_hash = Hash.new(0)
  numbers.each do |num|
    if num.even?
      result_hash[:even] += 1
    else
      result_hash[:odd] += 1
    end
  end
  result_hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  result_hash = Hash.new(0)
  most_common_vowels = []

  string.chars do |l|
    if "aeiou".include?(l)
      result_hash[l] += 1
    end
  end
  
  result_hash.each do |k, v|
    if v == result_hash.values.max
      most_common_vowels << k
    end
  end
  most_common_vowels.sort[0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  second_half_bday_students = students.select {|k, v| v > 6}.keys
  student_combos = []
  second_half_bday_students[0...-1].each_with_index do |name, idx|
    second_half_bday_students[idx+1..-1].each do |student|
      student_combos << [name, student]
    end
  end
  student_combos
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  specimen_hash = Hash.new(0)
  specimens.each do |specimen|
    specimen_hash[specimen] += 1
  end
  number_of_species = specimens.uniq.length
  smallest_population_size = specimen_hash.values.min
  largest_population_size = specimen_hash.values.max
  number_of_species**2 * smallest_population_size / largest_population_size
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  result = nil
  normal_hash = character_count(normal_sign)
  vandalized_hash = character_count(vandalized_sign)
  vandalized_hash.each do |key, value|
    return false if normal_hash.key?(key) == false || normal_hash[key] < value
  end
  true
end

def character_count(str)
  letter_hash = Hash.new(0)
  str.downcase.chars do |l|
    letter_hash[l] += 1
  end
  letter_hash
end
