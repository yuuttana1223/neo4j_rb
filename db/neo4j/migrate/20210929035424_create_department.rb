class CreateDepartment < Neo4j::Migrations::Base
  def up
    add_constraint :Department, :uuid
  end

  def down
    drop_constraint :Department, :uuid
  end
end
