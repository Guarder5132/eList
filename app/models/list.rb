class List < ActiveRecord::Base
    validates :content, presence:true ,length:{ maximum:50 }
end
