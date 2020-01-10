class Project
  attr_accessor :title

  # Class variables have been removed.

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id) # Note that this line has been changed.
  end
end
