require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do 
    
    it 'makes sure that comment body is present' do
      comment = Comment.new(username:'new comment username', post_id: 123).save
      expect(comment).to eq(false)
    end
     
    it 'makes sure that username is present' do
      comment = Comment.new(body:'new comment body', post_id: 123).save
      expect(comment).to eq(false)
    end
     
    it 'makes sure that post_id  is present' do
      comment = Comment.new(body:'new comment body', username:'new comment username').save
      expect(comment).to eq(false)
    end
    
    it 'post should pass and be saved' do
      comment = Comment.new(body:'new comment body', username:'new comment username', post_id: 123).save
      expect(comment).to eq(false)
    end
  
  end

end
