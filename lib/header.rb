def display_border(width)
  text = ""

  (width / 2).times do
    text = text + "= "
  end

  puts text
end

def display_dot_cloud(width, height, density)
  density = (1.0 - density) * 100

  height.times do
    text = ""

    width.times do
      random_value = Random.rand(1...100)

      if random_value >= density
        text = text + "."
      else
        text = text + " "
      end
    end

    puts text
  end
end

def display_title
  title_text = "\tW         O         R         D         M         I         N         D"

  puts title_text
end

def display_header(width)
  display_dot_cloud(width, 5, 0.2)
  display_border(width)
  puts ""
  display_title
  puts ""
  display_border(width)
  display_dot_cloud(width, 5, 0.2)
end
