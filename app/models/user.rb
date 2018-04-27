class User < ApplicationRecord

  validates_presence_of :name, :birthday, :number, :description

  def self.import(file)
    if File.extname(file.original_filename) != ".csv"
      return false
    else
      CSV.foreach(file.path, headers: true) do |row|
        name, birthday, number, description = row.to_hash['name'], row.to_hash['date'],row.to_hash['number'],row.to_hash['description']
        User.find_or_create_by(name:name, birthday:birthday,number:number,description:description)
      end
      return true
    end
  end

end
