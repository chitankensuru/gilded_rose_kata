module GildedRose
  class Item
    attr_reader :days_remaining, :quality

    def initialize(days_remaining, quality)
      @days_remaining, @quality = days_remaining, quality
    end

    def update_quality
    end
  end

  class Normal < Item
    def update_quality
      @days_remaining -= 1
      return if @quality == 0
      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie < Item
    def update_quality
      @days_remaining -= 1
      return if @quality >= 50
      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end

  class Sulfuras < Item
  end

  class Backstage < Item
    def update_quality
      @days_remaining -= 1

      return if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end

  DEFAULT_CLASS = Item
  SPECIALIZED_CLASSES = {
      'NORMAL ITEM'                               => Normal,
      'Aged Brie'                                 => Brie,
      'Backstage passes to a TAFKAL80ETC concert' => Backstage
  }

  def self.for(name, days_remaining, quality)
    (SPECIALIZED_CLASSES[name] || DEFAULT_CLASS).
        new(days_remaining, quality)
  end
end