class FixEmptyVersionLoads < ActiveRecord::Migration
  def self.up
    Version.open.where(:version_load_id => nil).each do |version|
      version.update_attributes(:version_load_id => VersionLoad.first.id)
    end
  end

  def self.down
  end
end
