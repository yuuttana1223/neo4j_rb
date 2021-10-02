class ForceCreateUniversityNameConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :University, :name, force: true
  end

  def down
    drop_constraint :University, :name
  end
end
