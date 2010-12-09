class AddWriterRole < ActiveRecord::Migration
  def self.up
    if !Role.find_by_role_name('Writer')
      if Role.create!(:role_name => 'Writer', :description => 'Writers may create content and edit their own', :allow_empty => true)
        puts "Writer role created."
      end
    end
  end
  def self.down
    Role.find_by_role_name('Writer').destroy
  end
end