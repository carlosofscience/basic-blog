require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do 

    it 'makes sure that title is present' do
      post = Post.new(body:'new post body', categories:'new cagetories').save
      expect(post).to eq(false)
    end
     
    it 'makes sure that body is present' do
      post = Post.new(title:'new post title', categories:'new cagetories').save
      expect(post).to eq(false)
    end
     
    it 'makes sure that category text is present' do
      post = Post.new(title:'new post title', body:'new post body').save
      expect(post).to eq(false)
    end
    
    it 'post should pass and be saved' do
      post = Post.new(title:'new post title', body:'new post body', categories:'new cagetories').save
      expect(post).to eq(true)
    end
    
  end
  
end
