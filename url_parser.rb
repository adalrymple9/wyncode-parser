class UrlParser
  def initialize(new_url)
    @new_url = new_url
  end

  def scheme
    #everything before the :
    flag = 0
    scheme = []
    @new_url.each_char { |chr|
      if chr == ":"
        flag = 1
	    elsif flag == 0
        scheme << chr
	    end
    }
    return scheme.join
  end

  def domain
    #name of the website
    flag2 = 0
    domain = []
    @new_url.each_char{ |chr|
      if chr == "/"
        flag2 += 1
	    elsif flag2 == 2 and chr == ":"
		    flag2 += 1
	    elsif flag2 == 2 and flag2 < 3
		    domain << chr
	end
}
  return domain.join
end

  def port
    #Ports are numbered, and most services have a pre-defined port that they usually work from
    flag3 = 0
    port = []
      @new_url.each_char { |chr|
        if chr == ":"
          flag3 += 1
        elsif flag3 == 2 and chr == "/"
          flag3 += 1
        elsif flag3 == 2 and flag3 < 3
          port << chr
		    end
}
  return port.join
  end

  def path
    # set of characters separated by slashes (/)
    flag4 = 0
path = []
  @new_url.each_char { |chr|
    if chr == "/"
      flag4 += 1
    elsif flag4 == 3 and chr == "?"
      flag4 += 1
	   elsif flag4 == 3 and flag4 < 4
       path << chr
	    end
}
  return path.join
end

  def query_string
    # input to a program that must be evaluated in a certain way
    flag5 = 0
    query_string = []
    query_string2 = []
    query_string3 = []
    query_string4 = []
  @new_url.each_char { |chr|
  	if chr == "?"
  		flag5 += 1
  	elsif flag5 == 1 and chr == "="
  		flag5 += 1
  	elsif flag5 == 1 and flag5 < 4
  		query_string << chr
  	end
  	}
	flag6 = 0
	@new_url.each_char { |chr|
		if chr == "="
			flag6 += 1
		elsif flag6 == 1 and chr == "&"
			flag6 += 1
		elsif flag6 == 1 and flag6 < 4
			query_string2 << chr
		end
		}
		flag7 = 0
    @new_url.each_char { |chr|
			if chr == "&"
				flag7 += 1
			elsif flag7 == 1 and chr == "="
				flag7 += 2
			elsif flag7 == 1 and flag7 < 4
				query_string3 << chr
			end
			}

			flag8 = 0
			@new_url.each_char { |chr|
				if chr == "="
					flag8 += 2
				elsif flag8 == 4 and chr == "#"
					flag8 += 1
				elsif flag8 == 4 and flag8 < 5
					query_string4 << chr
				end
				#"https://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat"
				}
				query_string4.join
        query_string = query_string.join
        query_string2 = query_string2.join
        query_string3 = query_string3.join
        query_string4 = query_string4.join
        query = ({query_string => query_string2 , query_string3 => query_string4})
  end

  def fragment_id
    #introduced by a hash mark
  end

end
