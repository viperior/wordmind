class String
  def all_possible_permutations
    self.chars.to_a.permutation.map(&:join)
  end
end
