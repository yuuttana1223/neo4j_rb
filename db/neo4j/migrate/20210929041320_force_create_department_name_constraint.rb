class ForceCreateDepartmentNameConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Department, :name, force: true
  end

  def down
    drop_constraint :Department, :name
  end
end
