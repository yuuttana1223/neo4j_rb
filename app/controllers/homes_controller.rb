class HomesController < ApplicationController
  include Neo4j::Node

  def top
    require "json"
    File.open("#{Rails.root}/app/models/concerns/school.json") do |f|
      # [{"大学": "大学名"}, {学部: "学部名"}, {"大学": "大学名"}, ...]
      @university_data = JSON.load(f)
    end

    @universities = []
    @departments = []
    @university_data.each_with_index do |element, index|
      if index.even?
        @universities.push(element)
      else
        @departments.push(element)
      end
    end

    @universities.each_with_index do |university, index|
      @departments.each do |department|
        create("(u:大学 {name: #{university["大学"]})-->(d:学部 {name: #{department}})}")
      end
    end
  end
end
