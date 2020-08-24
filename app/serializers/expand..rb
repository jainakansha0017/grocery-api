module Expandable
  def expands?(property)
    lambda { |opts| binding,pry; opts[:expand] && opts[:expand].split(',').include?(property) }
  end
end
