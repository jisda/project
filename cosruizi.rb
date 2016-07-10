#あとはfor文で100回コサイン類似度による画像比較し、すべてのデータまとめて
#jsonの型で返すようにする感じでいいのですか？
#骨組み的にはこんな感じです
require 'json'
require '画像百枚(json) = hundred'
require 'ユーザー理想(json) = perfectwomen'

JSON.parse('hundred')
JSON.parse('perfectwomen')


  #data1,data2に配列かハッシュを渡すと類似度が返る
  def calculate_similarity(data1,data2,type="cosine")
    if data1.class==Hash
      calculate_similarity_with_hash(data1,data2,type)
    end
  end

  #vector1とvector2に同じ長さの数列(要素が数字の配列)を渡すと類似度が返る
  #第三引数のtypeに"cosine","jaccard","dice"のいずれかを指定する(default="cosine")
  def calculate_similarity_with_array(vector1,vector2,type="cosine")
    if type=="cosine"   
      #コサイン類似度を計算
      similarity = cosine_similarity(vector1,vector2)
    end
    return similarity #類似度を返す
  end

  #hash1とhash2に比較したいhashを渡すと類似度が返る
  #二つのhashは異なる長さ、keyを持っていてもkeyを統合して長さが調整される
  def calculate_similarity_with_hash(hash1,hash2,type="cosine")
    hash3 = hash1.merge(hash2)
    hash3.each do |key,value|
      hash1[key] = 0 if hash1[key].blank?
      hash2[key] = 0 if hash2[key].blank?
    end
    vector1 = hash1.sort.map{|key,val|val}
    vector2 = hash2.sort.map{|key,val|val}
    if type=="cosine"   
      #コサイン類似度を計算
      similarity = cosine_similarity(vector1,vector2)
    end
    return similarity #類似度を返す
  end

  #コサイン類似度[START]
  def cosine_similarity(vector1, vector2)
    dp = dot_product(vector1, vector2)
    nm = normalize(vector1) * normalize(vector2)
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

 cosruizi = calculate_similarity_with_hash(data1,data2,type)
 JSON.generate(cosruizi)
