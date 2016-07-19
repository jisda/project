require 'json'
require ' hundred'      #画像百枚(json) 
require ' perfectwomen' #ユーザー理想(json)


#ハッシュ化
hundred_hash = JSON.parse('hundred')
perfectwomen_hash = JSON.parse('perfectwomen')

#用意されているの画像とユーザの入力したデータの一致化
p_element_key[]
p_element_value[]

h_element_key[]
h_element_value[]

hundred_hash[0].each{|key1, value1|
	h_element = key
  perfectwomen_hash.each{|key2, value2|
 	 if key = element then
	h_element = key1
        h_element_value = value1
	p_element = key2
	p_element_value = value2
	end
 }
}

cosine_similarity(h_element_value, p_element_value)

  #コサイン類似度[START]
  def cosine_similarity(h_element_value, p_element_value)
    dp = dot_product(h_element_value, p_element_value)
    nm = normalize(h_element_value) * normalize(p_element_value)
    dp / nm
  end

def dot_product(vector1, vector2)
    sum = 0.0
    vector1.each_with_index{ |val, i| sum += val*vector2[i] }
    sum
  end

def normalize(vector)
    Math.sqrt(vector.inject(0.0){ |m,o| m += o**2 })
end
  #コサイン類似度[END]
