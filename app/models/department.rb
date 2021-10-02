class Department
  include Neo4j::ActiveNode
  property :name, type: String, constraint: :unique
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  self.mapped_label_name = "学部"
end
