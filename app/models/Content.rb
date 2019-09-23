class Content < ApplicationRecord
  def self.permitted_functions
    ["to_s", "each", "each_with_index", "unshift", "length", "split", "new", "downcase", "upcase", "reverse", "gsub"]
  end
end
