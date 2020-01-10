class Project
  attr_accessor :title
  attr_reader :id

  # Class variables have been removed.

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end
end
