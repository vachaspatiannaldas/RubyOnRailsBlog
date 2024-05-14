class Blog < ApplicationRecord
    belongs_to :category, :dependent => :destroy

    has_one_attached :image 

    has_rich_text :content

end
