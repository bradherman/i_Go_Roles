class AddEditorRole < ActiveRecord::Migration
  def self.up
    if !Role.find_by_role_name('Editor')
      if Role.create!(:role_name => 'Editor', :description => 'Editors may create new content, edit all content, and delete unpublished.', :allow_empty => true)
        puts "Editor role created."
      end
    end
  end
  def self.down
    Role.find_by_role_name('Editor').destroy
  end
end