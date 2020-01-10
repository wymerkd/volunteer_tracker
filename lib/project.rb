class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.all
  returned_projects = DB.exec("SELECT * FROM projects;")
  projects = []
  returned_projects.each() do |project|
    title = project.fetch("title")
    id = project.fetch("id").to_i
    projects.push(Project.new({:title => title, :id => id}))
  end
  projects
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(other)
  self.class.eql?(other.class) & self.title.eql?(other.title)
  end

  # def self.clear
  # DB.exec("DELETE FROM projects *;")
  # end
end
