class AddPublisherRole < ActiveRecord::Migration
  def self.up
    if Role.create!(:role_name => 'Publisher', :description => 'Publishers add, edit, delete, publish, and unpublish anything.', :allow_empty => true)
      puts "Publisher role created."
    end
  end
  def self.down
    Role.find_by_role_name('Publisher').destroy
  end
end