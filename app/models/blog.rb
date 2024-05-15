class Blog < ApplicationRecord
    belongs_to :category, :dependent => :destroy

    has_one_attached :image 

    has_rich_text :content

    def self.ransackable_attributes(auth_object = nil)
        ["title"]
    end

end
