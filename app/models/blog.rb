class Blog < ApplicationRecord
    belongs_to :category, :dependent => :destroy

    has_one_attached :image 

end
