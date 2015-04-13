class GildedRose
  attr_reader :name, :sell_in, :quality

  def initialize(name, sell_in, quality )
    @name, @sell_in, @quality = name, sell_in, quality
  end

  def update_quality
    case name
      when 'NORMAL ITEM'
        return normal
      when 'Aged Brie'
        return brie
      when 'Sulfuras, Hand of Ragnaros'
        return sulfuras
      when 'Backstage passes to a TAFKAL80ETC concert'
        return backstage
    end

    if @name != 'Aged Brie' && @name != 'Backstage passes to a TAFKAL80ETC concert'
      if @quality > 0
        if @name != 'Sulfuras, Hand of Ragnaros'
          @quality -= 1
        end
      end
    else
      if @quality < 50
        @quality += 1
        if @name == 'Backstage passes to a TAFKAL80ETC concert'
          if @sell_in < 11
            if @quality < 50
              @quality += 1
            end
          end
          if @sell_in < 6
            if @quality < 50
              @quality += 1
            end
          end
        end
      end
    end
    if @name != 'Sulfuras, Hand of Ragnaros'
      @sell_in -= 1
    end
    if @sell_in < 0
      if @name != "Aged Brie"
        if @name != 'Backstage passes to a TAFKAL80ETC concert'
          if @quality > 0
            if @name != 'Sulfuras, Hand of Ragnaros'
              @quality -= 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality += 1
        end
      end
    end
  end

  def normal
    @sell_in -= 1
    return if @quality == 0
    @quality -= 1
    @quality -= 1 if @sell_in <= 0
  end

  def brie
    @sell_in -= 1
    return if @quality >= 50
    @quality += 1
    @quality += 1 if @sell_in <= 0 && @quality < 50
  end

  def sulfuras

  end

  def backstage
    @sell_in -= 1

    return if @quality >= 50
    return @quality = 0 if @sell_in < 0

    @quality += 1
    @quality += 1 if @sell_in < 10
    @quality += 1 if @sell_in < 5
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

# Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

