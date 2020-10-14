# require modules here
require "yaml"
require "pry" 

def load_library(path)
  library = YAML.load_file(path)
  library.each_with_object({}) do |(key, values), accum|
    values.each do |emoti|
       if !accum[emoti]
         accum[key] = {:english => values[0], :japanese => values[1]}
       end
    end
  end
 end 


def get_english_meaning(path, emoticon)
  result = 
  library = load_library(path)
  library.each do |meaning, emoticons|
    if emoticon == emoticons[:japanese]
      return meaning
    end
  end
     return  "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  library.each do |meaning, emoticons|
    if emoticon == emoticons[:english]
      return emoticons[:japanese]
  end
end
    return "Sorry, that emoticon was not found"

end

