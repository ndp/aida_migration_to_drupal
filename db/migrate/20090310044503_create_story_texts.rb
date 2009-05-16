class CreateStoryTexts < ActiveRecord::Migration
  def self.up
    create_table :story_texts do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :story_texts
  end
end
